class ItinerariesController < ApplicationController

  def show
    @itinerary = Itinerary.find(params[:id])
    @ride = Ride.new              # empty shell for creating rides in itinerary/show
    display_step                  # calling the steps from current itinerary
    @markers = @steps.geocoded.map do |step|
      {
        lat: step.latitude,
        lng: step.longitude
      }
    end
  end

  def new
    @itinerary = Itinerary.new
  end

  def create
    @itinerary = Itinerary.new(params_itinerary)
    @itinerary.user = current_user
    @steps = []
    unless params[:steps] == nil
      params[:steps].each { |step| @steps<<step[:address] }
      if @itinerary.save
        create_steps
        @itinerary.km = 0
        n = 0
        (@steps.count - 1).times do
          distance = Geocoder::Calculations.distance_between([@steps_object[n].latitude, @steps_object[n].longitude], [@steps_object[n+1].latitude, @steps_object[n+1].longitude], options: {units: :km})
          @itinerary.km += distance
          n += 1
        end
        @itinerary.save
        redirect_to itinerary_path(@itinerary)
      else
        render :new
      end
    else
      render :new
    end
  end

  def edit
    @itinerary = Itinerary.find(params[:id])
    display_step                  # calling the steps from current itinerary
    @markers = @steps.geocoded.map do |step|
      {
        lat: step.latitude,
        lng: step.longitude
      }
    end
  end

  def update
    if current_user
      @itinerary = Itinerary.find(params[:id])
      @itinerary.update(params_itinerary)
      if @itinerary.save
        redirect_to itinerary_path(@itinerary)
      else
        render :new
      end
    else
      redirect_to new_user_session_path
    end
  end

  def destroy
    @itinerary = Itinerary.find(params[:id])
    @itinerary.destroy
    redirect_to itineraries_path
  end


  private

  def params_itinerary
    params.require(:itinerary).permit(:km, :category, :description, :title, steps_attributes:[:address, :itinerary_id])
  end

  def create_steps
    @steps_object = []
    @steps.each do |step|
      @step = Step.create(address: step, itinerary_id: @itinerary.id)
      @steps_object << @step
    end
  end

  def display_step
    @steps = Step.where(itinerary_id: @itinerary.id)
  end

end

class RidesController < ApplicationController

  def index
    if params[:query].present?
      @max = params[:query][:km].to_i

      if params[:query][:km].present?
        sql_query = " \ itineraries.title ILIKE :location AND itineraries.km <= :km "
      else
        sql_query = " \ itineraries.title ILIKE :location"

      end
      @rides = Ride.joins(:itinerary).where(sql_query, location: "%#{params[:query][:location]}%", km: @max)
    else
      @rides = Ride.all
    end
  end




  def show
    @ride = Ride.find(params[:id])
    display_step                  # calling the steps from current itinerary
    @participant = @ride.participants.find_by(user: current_user) if current_user
    @markers = @steps.geocoded.map do |step|
      {
        lat: step.latitude,
        lng: step.longitude
      }
    end
  end

  def create
    @ride = Ride.new(params_ride)
    @itinerary = Itinerary.find(params[:itinerary_id])
    @ride.itinerary = @itinerary
    if @ride.save
      Participant.create(user: current_user, ride: @ride)
      redirect_to itinerary_path(@itinerary)
    else
      render :new
    end
  end

  #  def upvote
  #    @ride = Ride.find(params[:ride_id])
  #    @ride.vote += 1
  #    if @ride.save
  #     redirect_to ride_path(@ride, anchor: "div-chat")
  #    end
  #  end

  private

  def params_ride
    params.require(:ride).permit(:date)
  end

  def display_step
    @steps = Step.where(itinerary_id: @ride.itinerary.id)
  end

end

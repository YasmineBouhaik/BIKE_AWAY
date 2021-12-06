class RidesController < ApplicationController

  def index
    if params["range-1a"]
      @max = params["range-1a"].to_i
      @all_rides = Ride.all
      @rides = []
      @all_rides.each do |ride|
        if ride.itinerary.km <= @max
          @rides << ride
        end
      end
    elsif params[:query].present?
      @rides = []
      @itineraries = Itinerary.all
      @itineraries.each do |itinerary|
        if itinerary.title.include?(params[:query])
          @rides << itinerary.rides
        end
      end
      @rides = @rides[0] unless @rides.empty?
    else
      @rides = Ride.all
    end
    if params[:query].present?
      @itineraries = Itinerary.where("title ILIKE ?", "%#{params[:query]}%")
    else
      @itineraries = Itinerary.all
    end
  end

  def show
    @ride = Ride.find(params[:id])
  end

  def create
    @ride = Ride.new(params_ride)
    @itinerary = Itinerary.find(params[:itinerary_id])
    @ride.itinerary = @itinerary
    if @ride.save
      redirect_to itinerary_path(@itinerary)
    else
      render :new
    end
  end


  private

  def params_ride
    params.require(:ride).permit(:date)
  end

end

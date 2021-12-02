class RidesController < ApplicationController

  def index
    @rides = Ride.all
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

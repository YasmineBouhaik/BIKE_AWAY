class RidesController < ApplicationController

  def index
    @rides = Ride.all
  end

  def show
    @ride = Ride.find(params[:id])
  end

  def create
    if current_user
      @ride = Ride.new(params_ride)
      @itinerary = Itinerary.find(params[:itinerary_id])
      @ride.itinerary = @itinerary
      @ride.user = current_user
      if @ride.save
        redirect_to itinerary_path(@ride)
      else
        render :new
      end
    else
      redirect_to new_user_session_path
    end
  end


  private

  def params_ride
    params.require(:ride).permit(:date, :itinerary)
  end

end

class ItinerariesController < ApplicationController

  def show
    @itinerary = Itinerary.find(params[:id])
  end

  def new
    @itinerary = Itinerary.new
  end

  def create
    if current_user
      @itinerary = Itinerary.new(params_itinerary)
      @itinerary.user = current_user

      if @itinerary.save
        redirect_to itinerary_path(@itinerary)
      else
        render :new
      end
    else
      redirect_to new_user_session_path
    end
  end

  def edit
    @itinerary = Itinerary.find(params[:id])
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
    params.require(:itinerary).permit(:km, :category, :description, :title)
  end
end

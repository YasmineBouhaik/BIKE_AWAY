class StepsController < ApplicationController
  def destroy
    @step = Step.find(params[:id])
    @itinerary = @step.itinerary
    @step.destroy
    redirect_to edit_itinerary_path(@itinerary)
  end
end

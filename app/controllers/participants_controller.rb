class ParticipantsController < ApplicationController
  def create
    @participant = Participant.new(params_participant)
    @ride = Ride.find(params[:ride_id])
    @participant.ride = @ride
    @participant.user = current_user
    if @participant.save
      redirect_to ride_path(@participant)
    else
      render :new
    end
  end

  private

  def params_participant
    params.require(:participant).permit(:vote)
  end
end

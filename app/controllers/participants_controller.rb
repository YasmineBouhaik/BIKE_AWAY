class ParticipantsController < ApplicationController
  def create
    @participant = Participant.new(ride_id: params[:ride_id])
    @ride = Ride.find(params[:ride_id])
    @participant.ride = @ride
    @participant.user = current_user
    if @participant.save!
      redirect_to ride_path(@ride)
    end
    
  end

  def voted
     @ride = Ride.find(params[:ride_id])
     @participant = @ride.participants.find_by(user: current_user )
     @participant.voted = @participant.voted == false
     @participant.save
     redirect_to ride_path(@ride, anchor: "div-chat")
  end

  private

  def params_participant
    params.require(:participant).permit(:vote, :ride_id)
  end
end

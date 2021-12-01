class MessagesController < ApplicationController
  def create
    @message = Message.new(params_message)
    @ride = Ride.find(params[:ride_id])
    @message.ride = @ride
    @message.user = current_user
    if @message.save
      redirect_to ride_path(@message)
    else
      render :new
    end
  end

  private

  def params_message
    params.require(:message).permit(:content)
  end
end

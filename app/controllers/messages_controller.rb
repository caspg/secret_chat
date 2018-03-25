class MessagesController < ApplicationController
  def create
    message = Message.create(message_params)

    respond_to do |format|
      format.js { NewMessageJobJob.perform_later(message) }
      format.html { redirect_to_room_path }
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(
      user_id: current_user.id,
      room_id: current_room.id
    )
  end

  def current_user
    # TODO: create use_case for finding
    @current_user ||= User.find_by(secret_id: params[:user_secret_id])
  end

  def current_room
    # TODO: create use_case for finding
    @current_room ||= Room.find_by(secret_id: params[:room_secret_id])
  end

  def redirect_to_room_path
    redirect_to room_path(
      user_secret_id: current_user.secret_id,
      room_secret_id: current_room.secret_id
    )
  end
end

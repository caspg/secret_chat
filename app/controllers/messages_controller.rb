# TODO: refactor me please
class MessagesController < ApplicationController
  def create
    # TODO: maybe handle disabled-JS

    message = Message.create(message_params)
    NewMessageJobJob.perform_later(message)

    # redirect_to room_path(
    #   user_secret_id: current_user.secret_id,
    #   room_secret_id: current_room.secret_id
    # )
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(
      user_id: current_user.id,
      room_id: current_room.id
    )
  end

  def current_user
    @current_user ||= User.find_by(secret_id: params[:user_secret_id])
  end

  def current_room
    @current_room ||= Room.find_by(secret_id: params[:room_secret_id])
  end
end

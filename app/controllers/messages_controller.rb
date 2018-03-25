class MessagesController < ApplicationController
  def create
    result = Messages::Create.call(message_params: message_params)

    respond_to do |format|
      format.js { NewMessageJobJob.perform_later(result.message) }
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

  def current_room
    @current_room ||= find_room
  end

  def find_room
    ctx = Rooms::FindBySecretId.call(room_secret_id: params[:room_secret_id])
    ctx.room
  end

  def redirect_to_room_path
    redirect_to room_path(
      user_secret_id: current_user.secret_id,
      room_secret_id: current_room.secret_id
    )
  end
end

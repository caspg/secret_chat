class RoomsController < ApplicationController
  NUMBER_OF_VISIBLE_MESSAGES = 50

  def show
    @room = find_room

    return redirect_to root_path if !@room || !current_user

    @guest = User.new(room_id: @room.id)
    @guests = @room.guests
    @user_is_room_admin = @room.owner == current_user

    # TODO: create use_case
    @messages = @room.messages.includes(:user).last(NUMBER_OF_VISIBLE_MESSAGES)
    @new_message = Message.new
  end

  private

  def find_room
    ctx = Rooms::FindBySecretId.call(room_secret_id: params[:room_secret_id])
    ctx.room
  end
end

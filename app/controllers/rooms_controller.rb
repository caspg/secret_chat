class RoomsController < ApplicationController
  NUMBER_OF_VISIBLE_MESSAGES = 50

  def show
    #
    # TODO: should there be just single UseCase that
    # will return all needed objects (room, user, guests)?
    #
    @room = find_room
    @user = find_user

    return redirect_to root_path if !@room || !@user

    @guest = User.new(room_id: @room.id)
    @guests = @room.guests
    @user_is_room_admin = @room.owner == @user

    # TODO: create use_case
    @messages = @room.messages.includes(:user).last(NUMBER_OF_VISIBLE_MESSAGES)
    @new_message = Message.new
  end

  private

  def find_room
    ctx = Rooms::FindBySecretId.call(room_secret_id: params[:room_secret_id])
    ctx.room
  end

  def find_user
    ctx = Users::FindBySecretId.call(user_secret_id: params[:user_secret_id])
    ctx.user
  end
end

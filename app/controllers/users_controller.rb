class UsersController < ApplicationController
  def create
    @guest = create_guest_user
    @room = @guest.room
    @room_secret_id = @room.secret_id

    respond_to do |format|
      format.js {}
      format.html { redirect_to_room_path }
    end
  end

  private

  def create_guest_user
    ctx = Users::CreateUser.call(user_params: user_params)
    ctx.user
  end

  def user_params
    params.require(:user).permit(:login, :room_id)
  end

  def redirect_to_room_path
    redirect_to room_path(
      room_secret_id: @room_secret_id,
      user_secret_id: @room.owner.secret_id
    )
  end
end

class UsersController < ApplicationController
  def create
    @guest = create_guest_user
    @room_secret_id = guest.room.secure_id

    respond_to do |format|
      format.js {}
    end
  end

  private

  def create_guest_user
    UseCases::Users::CreateUser.new(user_params).perform
  end

  def user_params
    params.require(:user).permit(:login, :room_id)
  end
end

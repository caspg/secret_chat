class UsersController < ApplicationController
  def create
    binding.pry
  end

  private

  def user_params
    params.require(:user).permit(:login, :room_id)
  end
end

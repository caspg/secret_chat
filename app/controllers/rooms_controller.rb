class RoomsController < ApplicationController
  def show
    room = find_room
    user = find_user

    redirect_to root_path if !room || !user
  end

  private

  def find_room
    UseCases::Rooms::FindRoomBySecret.perform(params[:room_secret_id])
  end

  def find_user
    UseCases::Users::FindUserBySecret.perform(params[:user_secret_id])
  end
end

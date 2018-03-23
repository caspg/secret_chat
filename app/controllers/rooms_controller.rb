class RoomsController < ApplicationController
  def show
    #
    # TODO: should there be just single UseCase that
    # will return all needed objects (room, user, guests)?
    #
    room = find_room
    user = find_user

    redirect_to root_path if !room || !user

    @guest = User.new(room_id: room.id)
    @guests = room.guests
    @room_secret_id = room.secret_id
    @user_is_room_admin = room.owner == user
  end

  private

  def find_room
    UseCases::Rooms::FindRoomBySecret.perform(params[:room_secret_id])
  end

  def find_user
    UseCases::Users::FindUserBySecret.perform(params[:user_secret_id])
  end
end

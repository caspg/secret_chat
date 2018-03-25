class RoomsController < ApplicationController
  def show
    result = find_rooms_data

    return redirect_to root_path if !current_user || result.failure?

    @room = result.room
    @messages = result.messages
    @guests = result.guests

    @guest = User.new(room_id: @room.id)
    @new_message = Message.new

    @user_is_room_admin = @room.owner == current_user
  end

  private

  def find_rooms_data
    Rooms::FindRoomsData.call(room_secret_id: params[:room_secret_id])
  end
end

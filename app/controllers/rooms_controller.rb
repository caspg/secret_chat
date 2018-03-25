class RoomsController < ApplicationController
  def show
    result = find_rooms_data

    if !current_user || result.failure?
      redirect_to
    else
      assign_instance_variables(result)
    end
  end

  private

  def find_rooms_data
    Rooms::FindRoomsData.call(room_secret_id: params[:room_secret_id])
  end

  def assign_instance_variables(result)
    @room = result.room
    @messages = result.messages
    @guests = result.guests
    @new_guest = result.new_guest

    @new_message = Message.new
    @user_is_room_admin = @room.owner == current_user
  end
end

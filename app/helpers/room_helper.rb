module RoomHelper
  def user_is_room_admin?(room, current_user)
    room.owner == current_user
  end
end

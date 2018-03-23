module UserHelper
  def guest_room_url(room_secret_id, user_secret_id)
    room_url(
      room_secret_id: room_secret_id,
      user_secret_id: user_secret_id
    )
  end
end

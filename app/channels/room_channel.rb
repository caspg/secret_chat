class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room:#{params[:roomSecretId]}"
  end

  def unsubscribed
    stop_all_streams
  end
end

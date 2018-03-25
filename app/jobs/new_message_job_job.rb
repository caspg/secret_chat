class NewMessageJobJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast(
      "room:#{message.room.secret_id}",
      message: render_message(message)
    )
  end

  private

  def render_message(message)
    MessagesController.render(
      partial: 'rooms/chat_message',
      locals: { message: message }
    )
  end
end

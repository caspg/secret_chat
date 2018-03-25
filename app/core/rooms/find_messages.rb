module Rooms
  class FindMessages
    include Interactor

    delegate :room, to: :context

    def call
      context.messages = messages
    end

    private

    NUMBER_OF_VISIBLE_MESSAGES = 50

    def messages
      context.room.messages.includes(:user).last(NUMBER_OF_VISIBLE_MESSAGES)
    end
  end
end

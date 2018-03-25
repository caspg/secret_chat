module Rooms
  class ValidateRoomPresence
    include Interactor

    delegate :room, to: :context

    def call
      context.fail! unless context.room
    end
  end
end

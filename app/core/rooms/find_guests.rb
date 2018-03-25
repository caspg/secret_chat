module Rooms
  class FindGuests
    include Interactor

    delegate :room, to: :context

    def call
      context.guests = context.room.guests
    end
  end
end

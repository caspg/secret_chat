module Rooms
  class NewGuest
    include Interactor

    delegate :room, to: :context

    def call
      context.new_guest = User.new(room_id: room.id)
    end
  end
end

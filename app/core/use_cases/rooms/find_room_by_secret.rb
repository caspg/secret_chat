module UseCases
  module Rooms
    class FindRoomBySecret
      def self.perform(room_secret_id)
        Room.find_by(secret_id: room_secret_id)
      end
    end
  end
end

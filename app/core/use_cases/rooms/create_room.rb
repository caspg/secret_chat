module UseCases
  module Rooms
    class CreateRoom
      def self.perform(owner_id, room_name)
        Room.create!(
          secret_id: UseCases::GenerateSecretId.perform,
          user_id: owner_id,
          name: room_name
        )
      end
    end
  end
end

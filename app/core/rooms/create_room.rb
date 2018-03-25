module Rooms
  class CreateRoom
    include Interactor

    def call
      room = Room.new(room_params)

      if room.save
        context.room = room
      else
        context.fail!
      end
    end

    private

    def room_params
      {
        user_id: context.owner_id,
        name: context.room_name,
        secret_id: UseCases::GenerateSecretId.perform
      }
    end
  end
end

module Rooms
  class CreateRoom
    include Interactor

    delegate :owner_id, :room_name, to: :context

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
        user_id: owner_id,
        name: room_name,
        secret_id: UseCases::GenerateSecretId.perform
      }
    end
  end
end

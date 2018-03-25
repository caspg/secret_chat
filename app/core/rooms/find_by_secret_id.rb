module Rooms
  class FindBySecretId
    include Interactor

    delegate :room_secret_id, to: :context

    def call
      context.room = Room.find_by(secret_id: room_secret_id)
    end
  end
end

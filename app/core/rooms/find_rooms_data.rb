module Rooms
  class FindRoomsData
    include Interactor::Organizer

    organize Rooms::FindBySecretId,
             Rooms::ValidateRoomPresence,
             Rooms::FindGuests,
             Rooms::FindMessages
  end
end

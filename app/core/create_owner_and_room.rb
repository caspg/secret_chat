class CreateOwnerAndRoom
  include Interactor::Organizer

  organize Users::CreateUser,
           Rooms::AssignUserAsOwner,
           Rooms::CreateRoom
end

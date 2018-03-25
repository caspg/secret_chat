module Rooms
  class AssignUserAsOwner
    include Interactor

    delegate :user, to: :context

    def call
      context.owner = user
    end
  end
end

class CreateOwnerAndRoom
  include Interactor

  delegate :login, :room_name, to: :context

  def call
    context.owner = create_user
    context.room = create_room(context.owner)
  end

  private

  def create_user
    ctx = Users::CreateUser.call(login: login)
    ctx.user
  end

  def create_room(owner)
    ctx = Rooms::CreateRoom.call(
      owner_id: owner.id,
      room_name: room_name
    )
    ctx.room
  end
end

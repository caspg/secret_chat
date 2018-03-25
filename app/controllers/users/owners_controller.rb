module Users
  class OwnersController < ApplicationController
    def create
      owner = create_user
      room = create_room(owner)

      redirect_to room_path(
        room_secret_id: room.secret_id,
        user_secret_id: owner.secret_id
      )
    end

    private

    def create_user
      ctx = Users::CreateUser.call(login: params[:user_login])
      ctx.user
    end

    def create_room(owner)
      ctx = Rooms::CreateRoom.call(
        owner_id: owner.id, room_name:
        params[:room_name]
      )
      ctx.room
    end
  end
end

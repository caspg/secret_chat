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
      UseCases::Users::CreateUser.new(login: params[:user_login]).perform
    end

    def create_room(owner)
      UseCases::Rooms::CreateRoom.perform(owner.id, params[:room_name])
    end
  end
end

module Users
  class OwnersController < ApplicationController
    def create
      # TODO: validate params
      owner = create_user
      room = create_room(owner)
    end

    private

    def create_user
      UseCases::Users::CreateUser.perform(params[:user_login])
    end

    def create_room(owner)
      UseCases::Rooms::CreateRoom.perform(owner.id, params[:room_name])
    end
  end
end

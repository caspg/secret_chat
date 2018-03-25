module Users
  class OwnersController < ApplicationController
    def create
      result = create_owner_and_room

      if result.success?
        redirect_to room_path(
          room_secret_id: result.room.secret_id,
          user_secret_id: result.owner.secret_id
        )
      else
        flash[:error] = 'Invalid params!'

        redirect_to root_path
      end
    end

    private

    def create_owner_and_room
      CreateOwnerAndRoom.call(
        login: params[:user_login],
        room_name: params[:room_name]
      )
    end
  end
end

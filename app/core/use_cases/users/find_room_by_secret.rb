module UseCases
  module Rooms
    class FindUserBySecret
      def self.perform(user_secret_id)
        User.find_by(secret_id: user_secret_id)
      end
    end
  end
end

module UseCases
  module Users
    class CreateUser
      def initialize(params)
        @params = params
      end

      def perform
        User.create!(user_params)
      end

      private

      attr_reader :params

      def user_params
        whitelisted_params.merge(
          secret_id: UseCases::GenerateSecretId.perform
        )
      end

      def whitelisted_params
        params.slice(:login, :room_id)
      end
    end
  end
end

module UseCases
  module Users
    class CreateUser
      def self.perform(login)
        User.create!(
          secret_id: UseCases::GenerateSecretId.perform,
          login: login
        )
      end
    end
  end
end

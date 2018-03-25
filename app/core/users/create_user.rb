module Users
  class CreateUser
    include Interactor

    def call
      user = User.new(user_params)

      if user.save
        context.user = user
      else
        context.fail!
      end
    end

    private

    def user_params
      {
        login: context.login,
        secret_id: UseCases::GenerateSecretId.perform
      }
    end
  end
end

module Users
  class CreateUser
    include Interactor

    delegate :login, to: :context

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
        login: login,
        secret_id: UseCases::GenerateSecretId.perform
      }
    end
  end
end

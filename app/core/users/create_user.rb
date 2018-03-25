module Users
  class CreateUser
    include Interactor

    delegate :user_params, to: :context

    def call
      user = User.new(merged_user_params)

      if user.save
        context.user = user
      else
        context.fail!
      end
    end

    private

    def merged_user_params
      user_params.merge(
        secret_id: GenerateSecretId.call
      )
    end
  end
end

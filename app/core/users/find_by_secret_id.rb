module Users
  class FindBySecretId
    include Interactor

    delegate :user_secret_id, to: :context

    def call
      context.user = User.find_by(secret_id: user_secret_id)
    end
  end
end

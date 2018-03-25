class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    return unless params[:user_secret_id]

    @current_user ||= find_current_user
  end

  private

  def find_current_user
    ctx = Users::FindBySecretId.call(user_secret_id: params[:user_secret_id])
    ctx.user
  end
end

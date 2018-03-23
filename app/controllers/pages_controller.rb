class PagesController < ApplicationController
  def home
    render plain: UseCases::Users::CreateUser.new.perform
  end
end

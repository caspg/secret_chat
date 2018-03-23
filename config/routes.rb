Rails.application.routes.draw do
  get 'pages/home'
  root 'pages#home'

  namespace 'users' do
    post 'owners', to: 'owners#create'
  end

  get '/:room_secret_id/:user_secret_id', to: 'rooms#show', as: :room
end

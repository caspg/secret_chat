Rails.application.routes.draw do
  get 'pages/home'
  root 'pages#home'

  namespace 'users' do
    post 'owners', to: 'owners#create'
  end
end

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :user_stories, only: [:create, :destroy]
end

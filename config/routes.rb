Rails.application.routes.draw do
  devise_for :users
  resources :articles, only: [:index]
  resources :users_articles, only: [:create]

  root to: 'articles#index'
  
end

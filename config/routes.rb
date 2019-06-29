Rails.application.routes.draw do
  resources :news
  devise_for :users
  root to: 'news#new'
end

Rails.application.routes.draw do
  # devise_for :users
  root to: "articles#index"

  patch 'user_articles/:id/like', to:'user_articles#like' , as: :like
  patch 'user_articles/:id/unlike', to:'user_articles#unlike' , as: :unlike

  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    post '/users/sign_up' => 'devise/registrations#create'
  end

  # get '/articles', to: "articles#index"
  resources :articles

  get '/liked_articles', to: "articles#liked_articles"

  resources :users
  resources :sessions

  

  # get 'user/edit' => 'users#edit', :as => :edit_current_user
  # get 'signup' => 'users#new', :as => :signup
  # get 'login' => 'sessions#new', :as => :login
  # get 'logout' => 'sessions#destroy', :as => :logout

end

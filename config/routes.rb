Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root 'devise/sessions#new'
  end

  resources :stories, only: [:show, :index] do
    post 'picked'
  end
end

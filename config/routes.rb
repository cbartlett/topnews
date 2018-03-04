Rails.application.routes.draw do
  devise_for :users
  post 'star', to: "story#star"

  root to: 'pages#home'
end

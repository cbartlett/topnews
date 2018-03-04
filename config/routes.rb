Rails.application.routes.draw do
  devise_for :users
  post 'star', to: "story#star"
  get 'starred_stories', to: "story#starred"

  root to: 'pages#home'
end

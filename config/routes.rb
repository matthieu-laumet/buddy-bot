Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :topics do
    resources :interactions
    resources :schedules
  end

  resources :interactions, only: [] do
    resources :options
  end

  resources :posts, only: :index
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

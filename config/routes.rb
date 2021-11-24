Rails.application.routes.draw do
  get 'users/profile'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: 'pages#home'

  resources :topics do
    resources :interactions, except: [:destroy, :index, :new, :edit, :update]
    resources :schedules
  end

  resources :interactions, only: [:destroy] do
    resources :options, only: [:new, :create, :destroy]
  end

  resources :posts, only: :index
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

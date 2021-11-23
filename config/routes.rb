Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :topics do
    resources :interactions, except: [:destroy, :index, :new, :edit, :update]
    resources :schedules
  end

  resources :interactions, only: [:destroy] do
    resources :options, only: [:new, :create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

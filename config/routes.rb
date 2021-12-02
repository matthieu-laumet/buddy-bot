Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'users/profile'
  post 'slack/interactive_endpoint', to: "slack/commands#interactive_endpoint"
  devise_for :users
  root to: 'pages#home'

  resources :topics do

    resources :interactions, except: [:index, :new, :edit, :update], shallow: true do
      resources :options, only: [:new, :create]
    end

  end

  resources :schedules, only: [:index, :destroy, :create]
  # resources :interactions, only: [:destroy] do
  #   resources :options, only: [:new, :create]
  # end

  resources :options, only: :destroy

  resources :posts, only: :index

  resources :options, only: [] do
    resources :answers, only: [:show, :new, :create]
  end

  resources :users, only: [:index, :update, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

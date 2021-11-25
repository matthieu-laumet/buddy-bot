Rails.application.routes.draw do
  get 'users/profile'
  devise_for :users
  root to: 'pages#home'

  resources :topics do
    resources :interactions, except: [:index, :new, :edit, :update], shallow: true do
      resources :options, only: [:new, :create]
    end
    resources :schedules
  end

  # resources :interactions, only: [:destroy] do
  #   resources :options, only: [:new, :create]
  # end

  resources :options, only: :destroy

  resources :posts, only: :index

  resources :options, only: [] do
    resources :answers, only: [:show, :new, :create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

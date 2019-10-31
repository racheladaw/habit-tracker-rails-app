Rails.application.routes.draw do
  root to: 'users#home'

  resources :categories, only: [:new, :create, :index] do
    resources :habits, only: [:index, :new]
  end

  resources :goals, only: [:create, :index, :update, :destroy]

  resources :habits, only: [:create] do
    resources :goals, only: [:new, :show, :edit]
  end

  resources :sessions, only: [:new, :create]

  resources :users, only: [:new, :create, :show]

  post :logout, to: 'sessions#destroy'

  get '/auth/facebook/callback', to: 'sessions#create'

  get :home, to: 'users#home'

  post '/completed_habit/:id', to: 'goals#completed_habit', as: 'completed_habit'

  get '/greatest_user', to: 'users#greatest_user'
end

Rails.application.routes.draw do
  root to: 'users#home'

  resources :users, only: [:new, :create, :show]

  resources :sessions, only: [:new, :create]

  resources :habits, only: [:create] do
    resources :goals, only: [:new, :show, :edit]
  end

  resources :goals, only: [:create, :index, :update, :destroy]

  resources :categories, only: [:new, :create, :index] do
    resources :habits, only: [:index, :new]
  end

  post '/logout' => 'sessions#destroy'

  get '/auth/facebook/callback' => 'sessions#create'

  get :home, to: 'users#home'

  post '/completed_habit/:id' => 'goals#completed_habit', as: 'completed_habit'

  get '/greatest_user' => 'users#greatest_user'


end

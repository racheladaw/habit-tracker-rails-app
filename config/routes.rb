Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create, :show]

  resources :sessions, only: [:new, :create]

  resources :habits, only: [:create] do
    resources :goals, only: [:new, :show, :edit]
  end

  resources :goals, only: [:create, :index]

  resources :categories, only: [:new, :create, :index] do
    resources :habits, only: [:index, :new]
  end

  post '/logout' => 'sessions#destroy'

  get '/auth/facebook/callback' => 'sessions#create'

  
end

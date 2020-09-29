Rails.application.routes.draw do
  root 'users#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/auth/google_oauth2/callback' => 'sessions#omniauth'

  resources :users, only: [:new, :create, :show] do
    resources :friends, only: [:index, :new]
  end
  # resources :messages
  # resources :friends
end

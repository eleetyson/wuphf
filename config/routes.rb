Rails.application.routes.draw do
  root 'users#home'
  get '/auth/google_oauth2/callback' => 'sessions#omniauth'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  resources :users, only: [:new, :create]
  # resources :messages
  # resources :friends
end

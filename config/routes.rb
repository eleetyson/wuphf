Rails.application.routes.draw do
  root 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  resources :users, only: [:new, :create]
  # resources :messages
  # resources :friends
end

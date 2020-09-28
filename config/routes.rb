Rails.application.routes.draw do
  root 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  resources :users, only: [:new, :create]
  # resources :messages
  # resources :friends
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

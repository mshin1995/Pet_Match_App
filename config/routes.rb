Rails.application.routes.draw do
  resources :dislikes, only: [:create, :index]
  resources :likes, only: [:create, :index]
  resources :users

  resources :conversations do
    resources :messages
  end

  root 'application#index'

  get '/users/:id/random', to: 'users#random'
  get '/users/:id/matches', to: 'users#matches'
  get '/users/:id/profile', to: 'users#profile'
  get '/users/:id/no_matches', to: 'users#no_matches'
  get '/users/:id/new_match/:likee_id', to: 'users#new_match'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'
  get '/users/:id/delete', to: 'users#destroy'

end

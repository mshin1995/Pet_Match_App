Rails.application.routes.draw do
  resources :dislikes, only: [:create, :index]
  resources :likes, only: [:create, :index]
  resources :users

  get '/users/:id/random', to: 'users#random'
  get '/users/:id/likes', to: 'users#likes'
  get '/users/:id/dislikes', to: 'users#dislikes'
  get '/users/:id/matches', to: 'users#matches'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'

end

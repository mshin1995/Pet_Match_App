Rails.application.routes.draw do
  resources :dislikes
  resources :likes
  resources :users

  get '/users/:id/random', to: 'users#random'
  get '/users/:id/likes', to: 'users#likes'
  get '/users/:id/dislikes', to: 'users#dislikes'
  get '/users/:id/matches', to: 'users#matches'

end

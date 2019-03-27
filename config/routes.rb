Rails.application.routes.draw do
  resources :dislikes
  resources :matches
  resources :likes
  resources :users

  get '/users/:id/random', to: 'users#random'
  get '/users/:id/likes', to: 'users#likes'
  get '/users/:id/dislikes', to: 'users#dislikes'

end

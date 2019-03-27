Rails.application.routes.draw do
  resources :matches
  resources :likes
  resources :users

  get '/users/:id/random', to: 'users#random'
  get '/users/:id/likes', to: 'users#likes'

end

Rails.application.routes.draw do
  resources :likes
  resources :users

  get '/users/:id/random', to: 'users#random'
  

end

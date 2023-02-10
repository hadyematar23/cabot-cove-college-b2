Rails.application.routes.draw do

  get '/residents', to: 'residents#index'
  get '/residents/:id', to: 'residents#show'
  get '/courses', to: 'courses#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

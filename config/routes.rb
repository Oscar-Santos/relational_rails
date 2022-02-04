Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/bands' , to: 'bands#index'
  get '/chefs' , to: 'chefs#index'
  get '/chef/:id' , to: 'chefs#show'
end

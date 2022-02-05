Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/bands', to: 'bands#index'
  get '/bands/:id', to: 'bands#show'
  get '/musicians', to: 'musicians#index'
  get '/musicians/:id', to: 'musicians#show'
  get '/bands/:band_id/musicians', to: 'band_musicians#index'
  get '/chefs' , to: 'chefs#index'
  get '/chef/:id' , to: 'chefs#show'

end

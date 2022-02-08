Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/bands', to: 'bands#index'
  get '/bands/new', to: 'bands#new'
  get '/bands/:id', to: 'bands#show'
  get '/musicians', to: 'musicians#index'
  get '/musicians/:id', to: 'musicians#show'
  get '/bands/:band_id/musicians', to: 'band_musicians#index'
  get '/chefs' , to: 'chefs#index'
  get '/chefs/:id' , to: 'chefs#show'
  get '/entrees' , to: 'entrees#index'
  get '/entrees/:id' , to: 'entrees#show'
  get '/chefs/:chef_id/entrees' , to: 'chefs_entrees#index'

  post '/chefs' , to: 'chefs#create'
  get '/chefs/new' , to: 'chefs#new'

  post '/bands', to: 'bands#create'

  get '/bands/:id/edit', to: 'bands#edit'
  patch '/bands/:id', to: 'bands#update'

end

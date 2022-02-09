Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/chefs' , to: 'chefs#index'
  get '/chefs/new' , to: 'chefs#new'
  get '/chefs/:id' , to: 'chefs#show'
  get '/entrees' , to: 'entrees#index'
  get '/entrees/:id' , to: 'entrees#show'
  get '/chefs/:chef_id/entrees' , to: 'chefs_entrees#index'
  post '/chefs' , to: 'chefs#create'


  get '/musicians', to: 'musicians#index'
  get '/musicians/:id', to: 'musicians#show'
  get '/bands/:band_id/musicians', to: 'band_musicians#index'
  get '/bands', to: 'bands#index'
  get '/bands/new', to: 'bands#new'
  get '/bands/:id', to: 'bands#show'
  post '/bands', to: 'bands#create'
  get '/bands/:id/edit', to: 'bands#edit'
  patch '/bands/:id', to: 'bands#update'
  get '/bands/:id/musicians/new', to: 'musicians#new'
  post '/bands/:id/musicians', to: 'musicians#create'
  get '/musicians/:id/edit', to: 'musicians#edit'
  patch '/musicians/:id', to: 'musicians#update'
  delete '/bands/:id', to: 'bands#destroy'
  delete '/musicians/:id', to: 'musicians#destroy'





end

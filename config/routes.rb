Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/bands' , to: 'bands#index'
  get '/chefs' , to: 'chefs#index'

  get '/chefs/:id' , to: 'chefs#show'
  get '/entrees' , to: 'entrees#index'
  get '/entrees/:id' , to: 'entrees#show'
  # get '/chefs/:chef_id/entrees' , to: 'chefs_entrees#index'
end

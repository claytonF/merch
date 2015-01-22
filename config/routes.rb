Rails.application.routes.draw do
  

  # 1. change the default landing page to primary resource landing page - in this instance it will be products
  root "products#index"

  resources :users, except: :index
  resources :products
  # create a single resource - not the default set of routes
  # known as a singular resource
  resource :session, only: [:new, :create, :destroy]
 
end

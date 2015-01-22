Rails.application.routes.draw do
  # 1. change the default landing page to primary resource landing page - in this instance it will be products
 root "products#index"


 resources :users, except: :index
 resources :products
 
end

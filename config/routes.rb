Rails.application.routes.draw do
  get 'products/index'

  get 'products/show'

  get 'products/new'

  get 'products/edit'

 # 1. change the default landing page to primary resource landing page - in this instance it will be products
 root "products#index"
 
end

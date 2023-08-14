


Rails.application.routes.draw do
  resources :products
  resources :stores
  resources :stock_availabilities
  # resources :prices
  # resources :stores do
  # resources :products do
  #   resource :price, only: [:new, :create, :edit, :update]
  # end
end

  
# end




# Rails.application.routes.draw do
#   resources :stores do
#     resources :products do
#       resource :price, only: [:new, :create, :edit, :update]
#     end
#   end

#   root 'stores#index'
# end




# Rails.application.routes.draw do
#   resources :stores, only: [:new, :create, :show]
#   resources :products, only: [:new, :create, :show] do
#     resources :prices, only: [:create]
#   end
# end

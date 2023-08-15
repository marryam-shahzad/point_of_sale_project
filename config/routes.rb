


Rails.application.routes.draw do
  resources :products
  resources :stores
  resources :stocks

  resources :stocks, only: [:index] do
    member do
      get 'store/:store_id', to: 'stocks#show_store', as: :store
      get 'product/:product_id', to: 'stocks#show_product', as: :product
    end
  end




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

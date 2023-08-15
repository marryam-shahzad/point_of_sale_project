class StocksController < ApplicationController
  def index
    @stores = Store.all
    @products = Product.all
  end

  def show_store
    @store = Store.find(params[:store_id])
    @products = @store.products
  end

  def show_product
    @product = Product.find(params[:product_id])
    @store = @product.store
  end
end

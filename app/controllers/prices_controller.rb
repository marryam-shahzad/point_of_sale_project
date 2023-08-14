# class PricesController < ApplicationController
#   before_action :set_store_and_product
#   before_action :set_price, only: [:edit, :update]

#   def new
#     @price = @product.build_price
#   end

#   def create
#     @price = @product.build_price(price_params)
#     if @price.save
#       redirect_to store_product_path(@store, @product), notice: 'Price was successfully added.'
#     else
#       render 'new'
#     end
#   end

#   def edit
#   end

#   def update
#     if @price.update(price_params)
#       redirect_to store_product_path(@store, @product), notice: 'Price was successfully updated.'
#     else
#       render 'edit'
#     end
#   end

#   private

#   def set_store_and_product
#     # @store = Store.find(params[:store_id])
#     # @product = @products.find(params[:product_id])
#   end

#   def set_price
#     @price = @product.price
#   end

#   def price_params
#     params.require(:price).permit(:price)
#   end
# end









# app/controllers/prices_controller.rb
class PricesController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @price = @product.build_price(price_params)
    if @price.save
      redirect_to product_path(@product)
    else
      @product = Product.find(params[:product_id])
      render 'products/show'
    end
  end

  private

  def price_params
    params.require(:price).permit(:amount)
  end
end

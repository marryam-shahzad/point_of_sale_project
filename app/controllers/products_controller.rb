# app/controllers/products_controller.rb
class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].present?
      @products = Product.paginate(page: params[:page], per_page: 20).where("name LIKE ?", "%#{params[:search]}%")
    else
      # @products = Product.all
      @products = Product.paginate(page: params[:page], per_page: 20)
    end
  end

  def show
    # @product = Product.first
  end

  # def new
  #   @product = Product.new

  #   # @product = Product.new(product_params)
  
  #   # if @product.save
  #   #   params[:product][:store_ids].each do |store_id|
  #   #     price_value = params[:product]["price_store_#{store_id}"]
  #   #     @product.product_stores.create(store_id: store_id, price: price_value)
  #   #   end
  #   #   redirect_to @product, notice: 'Product was successfully created.'
  #   # else
  #   #   render :new
  #   # end
  # end

  def new
    @product = Product.new
    @stores = Store.all


    # @product = Product.new
    # @product.product_stores.build


  end

  def create
    @product = Product.new(product_params)
    @stores = Store.all

    if @product.save
      save_product_stores
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end


  # def create
  #   @product = Product.new(product_params)
  #   price_value = params[:product][:price_value]

  #   if @product.save
  #     if price_value.present?
  #       @product.create_price(value: price_value)
  #     end
  #     redirect_to @product, notice: 'Product was successfully created.'
  #     # redirect_to store_products_path(@store), notice: 'Product was successfully created.'
  #     # Handle successful creation
  #   else
  #     # Handle validation errors
  #     render :new
  #   end
  # end


  # def create
  #   @product = Product.new(product_params)
  #   price_value = params[:product][:price_value]

  #   if @product.save
  #     if price_value.present?
  #       Price.create(product: @product, value: price_value)
  #     end
  #       redirect_to @product, notice: 'Product was successfully created.'
      
  #   else
  #     render :new
  #   end
  # end


  # def create
  #   @product = Product.new(product_params)
  #   # product_id = params[:product][:product_id]
  #   # price_value = params[:product][:price_value]

  #   if @product.save
  #   #   if price_value.present?
  #     #   Price.create(product_id: product_id, value: price_value.to_f)
  #     # end
  #     redirect_to @product, notice: 'Product was successfully created.'
  #   else
  #     render :new
  #   end
  # end






  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  # def destroy
  #   @product.destroy
  #   redirect_to products_url, notice: 'Product was successfully destroyed.'
  # end

  def del_product
    Product.find(params[:id]).destroy
    redirect_to products_path, notice: 'Product was successfully deleted.'
  end

 def destroy
  @product = Product.find(params[:id])
  @product.destroy
  redirect_to products_path, notice: 'Product was successfully deleted.'
 end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    # params.require(:product).permit( :name, :description, :price, :quantity, :store_id, :image)
    # params.require(:product).permit(:name, :description, :quantity, :price, product_stores_attributes: [:id, :store_id, :price])
    # params.require(:product).permit(:name, :description, :price, :quantity, :product_image, product_stores_attributes: [:id, :store_id, :price])
    # params.require(:product).permit(:name, :description, :price, :quantity, :product_image, store_ids: [])
    # params.require(:product).permit(:name, :description, :quantity, :price, :product_image, store_ids: [], product_stores_attributes: [:id, :store_id, :price])
    # params.require(:product).permit(
    #   :name, :description, :quantity, :price, :product_image,
    #   store_ids: [],
    #   product_stores_attributes: [:id, :store_id, :price]
    # )
    params.require(:product).permit(:name, :description, :quantity, :price, :product_image, store_ids: [])
  end

  def product_params
    params.require(:product).permit(:name, :description, :quantity, :price, :product_image, store_ids: [])
  end

  def save_product_stores
    params[:store_ids].each do |store_id|
      price = params[:prices][store_id]
      ProductStore.create(product: @product, store_id: store_id, price: price)
    end
  end






end

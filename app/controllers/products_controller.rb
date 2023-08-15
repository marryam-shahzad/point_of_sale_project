# app/controllers/products_controller.rb
class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].present?
      @products = Product.where("name LIKE ?", "%#{params[:search]}%")
    else
      @products = Product.all
    end
  end

  def show
  end

  def new
    @product = Product.new
    # @product.build_price
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


  def create
    @product = Product.new(product_params)
    # product_id = params[:product][:product_id]
    # price_value = params[:product][:price_value]

    if @product.save
    #   if price_value.present?
      #   Price.create(product_id: product_id, value: price_value.to_f)
      # end
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end






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
    params.require(:product).permit( :name, :description, :price, :quantity, :store_id)
  end







end

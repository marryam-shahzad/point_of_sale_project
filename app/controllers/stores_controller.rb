class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]

  def index
    @stores = Store.all
  end

  def show
    @store = Store.find(params[:id])
    @matching_products = Product.where(store_id: @store.id)
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)

    if @store.save
      redirect_to @store, notice: 'Store was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @store.update(store_params)
      redirect_to @store, notice: 'Store was successfully updated.'
    else
      render :edit
    end
  end


  

  def destroy
    @store = Store.find(params[:id])
    @store.products.destroy_all  # Destroy associated products
    @store.destroy
    redirect_to stores_path
  end


  private

  def set_store
    @store = Store.find(params[:id])
  end

  def store_params
    params.require(:store).permit(:name, :location)
  end
end

class RemovePriceAndProductFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :price_id
    remove_column :products, :product_id
  end
end

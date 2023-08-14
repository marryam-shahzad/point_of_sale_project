class AddPriceIdToProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :price, null: true, foreign_key: true, default: nil
  end
end

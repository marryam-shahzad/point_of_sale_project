class CreateStockAvailabilities < ActiveRecord::Migration[6.0]
  def change
    create_table :stock_availabilities do |t|
      t.references :product, foreign_key: true
      t.references :store, foreign_key: true
      t.integer :quantity
      t.timestamps
    end
  end
end

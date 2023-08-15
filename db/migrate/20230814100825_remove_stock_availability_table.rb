class RemoveStockAvailabilityTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :stock_availabilities
  end

  def down
    create_table :stock_availabilities do |t|
      t.references :store, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :quantity_available
      t.timestamps
    end
  end
end

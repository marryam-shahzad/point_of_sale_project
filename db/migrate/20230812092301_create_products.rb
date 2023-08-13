class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :quantity
      t.datetime :created_at
      t.datetime :updated_at


      t.references :store, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end

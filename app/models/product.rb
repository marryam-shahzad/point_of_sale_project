# class Product < ApplicationRecord
#   belongs_to :store
#   has_one :price

#   # Other validations and attributes

#   validates :name, presence: true
#   validates :description, presence: true
#   validates :price, presence: true
#   validates :quantity, presence: true
# end



# class Product < ApplicationRecord
#   belongs_to :store
#   # has_one :price
# end


# app/models/product.rb
# class Product < ApplicationRecord
#   belongs_to :store
#   after_create :create_stock_availability

#   private

#   def create_stock_availability
#     StockAvailability.create(product: self, store: self.store, quantity: 0)
#   end
# end


class Product < ApplicationRecord
  belongs_to :store
  has_one :stock
  validates :quantity, numericality: { greater_than: 0, message: "must be greater than 0" }
  has_one_attached :image
  has_many :product_stores
  has_many :stores, through: :product_stores

  accepts_nested_attributes_for :product_stores
  
end



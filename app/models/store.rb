class Store < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :product_stores
  has_many :products, through: :product_stores
end



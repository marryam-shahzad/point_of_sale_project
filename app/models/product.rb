class Product < ApplicationRecord
  belongs_to :store

  # Other validations and attributes

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
end

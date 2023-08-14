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
class Product < ApplicationRecord
  belongs_to :store
  # has_one :price
end


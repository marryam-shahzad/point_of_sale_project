class StockAvailability < ApplicationRecord
  belongs_to :store
  belongs_to :product
end

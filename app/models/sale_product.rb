class SaleProduct < ApplicationRecord
  belongs_to :sale
  belongs_to :product

  validates :quantity, numericality: { greater_than: 0 }
  validates :product_id, presence: true
end

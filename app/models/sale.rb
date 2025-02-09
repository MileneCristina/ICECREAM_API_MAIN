class Sale < ApplicationRecord
  belongs_to :user

  has_many :sale_products, dependent: :destroy
  has_many :products, through: :sale_products

  validates :amount, :sale_date, presence: true

  # Permitir nested attributes para SaleProducts
  accepts_nested_attributes_for :sale_products, allow_destroy: true
end

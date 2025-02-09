class Product < ApplicationRecord
  belongs_to :category

  has_many :sale_products, dependent: :destroy
  has_many :sales, through: :sale_products
  has_many :rates, dependent: :destroy
  has_many :users, through: :user_rate_products

  validates :title, :description, :brand, :value, :size, :quantity, presence: true
end

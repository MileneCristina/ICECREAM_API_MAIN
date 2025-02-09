class User < ApplicationRecord
  has_many :addresses, dependent: :destroy
  has_many :sales, dependent: :destroy
  has_many :rates, dependent: :destroy

  validates :name, :email, :password, :role, presence: true
  validates :email, uniqueness: true

  # Permite criar ou atualizar addresses junto com o usuário
  accepts_nested_attributes_for :addresses, allow_destroy: true
end

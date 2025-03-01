class Category < ApplicationRecord
  has_one_attached :picture
  has_many :products
  validates_associated :products
  validates :name, presence: true, uniqueness: true, length: { in: 3..20 }
end

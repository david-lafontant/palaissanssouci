class Product < ApplicationRecord
  belongs_to :category
  has_many_attached :pictures
end

class LineItem < ApplicationRecord
  belongs_to :cart, optional: true
  belongs_to :order, optional: true
  belongs_to :product

  validates :quantity, :product_price, :subtotal, presence: true
  validates :product_price, :subtotal, numericality: { greater_than_or_equal_to: 1.0 }
end

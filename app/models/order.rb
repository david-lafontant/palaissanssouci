class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
  validates_associated :line_items
  enum :payment_method, %i[paypal card crypto].freeze, default: :card, validate: true

  validates :first_name, :last_name, :address_line1, :city, :state, :country, :zipcode, :telephone,
            :payment_method, :email, presence: true
  validates :address_line2, :intruction, length: { in: 2..140 }, allow_nil: true
  validates :first_name, :last_name, :city, :state, :country, length: { in: 2..40 }
  validates :address_line1, length: { in: 10..80 }

  validates :email,
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: 'Invalid format' }

  validates :telephone,
            format: { with: /\A([0-9\s\-]{7,})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?\z/,
                      message: 'Invalid format' }
  validates :zipcode,
            format: { with: /\A\d{4,5}(?:[-\s]\d{4})?\z/, message: 'Invalid format' }

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end

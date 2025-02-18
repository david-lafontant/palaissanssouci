class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items

  def add_product(product, quantity)
    current_item = line_items.find_by(product_id: product.id)
    price = Product.find(product.id).price
    subtotal = price * quantity.to_i
    if current_item
      current_item.quantity += quantity.to_i
      current_item.subtotal += subtotal
    else
      current_item = line_items.build(product_id: product.id, product_price: price, quantity: quantity,
                                      subtotal: subtotal)
    end
    current_item
  end

  def total_price
    line_items.sum(&:subtotal)
  end
end

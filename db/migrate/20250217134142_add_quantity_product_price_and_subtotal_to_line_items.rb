class AddQuantityProductPriceAndSubtotalToLineItems < ActiveRecord::Migration[8.0]
  def up
    add_column :line_items, :quantity, :integer, default: 1
    add_column :line_items, :product_price, :decimal, null: false
    add_column :line_items, :subtotal, :decimal, null: false
  end

  def down
    remove_column :line_items, :quantity
    remove_column :line_items, :product_price
    remove_column :line_items, :subtotal
  end

end

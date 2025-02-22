class CreateOrders < ActiveRecord::Migration[8.0]
  def up
    create_table :orders do |t|
      t.string :first_name
      t.string :last_name
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :state
      t.string :country
      t.string :zipcode
      t.string :telephone
      t.text :intruction
      t.integer :payment_method
      t.string :email

      t.timestamps
    end
  end

  def down
    remove_table :orders
  end
end

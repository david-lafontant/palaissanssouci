class CreateCarts < ActiveRecord::Migration[8.0]
  def up
    create_table :carts do |t|
      t.timestamps
    end
  end

  def down
    remove_table :carts
  end
end

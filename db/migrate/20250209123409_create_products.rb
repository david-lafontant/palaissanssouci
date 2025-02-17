class CreateProducts < ActiveRecord::Migration[8.0]
  def up
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end

  def down
    remove_table :products
  end
end

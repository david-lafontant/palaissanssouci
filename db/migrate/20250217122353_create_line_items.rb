class CreateLineItems < ActiveRecord::Migration[8.0]
  def up
    create_table :line_items do |t|
      t.references :product, null: false, foreign_key: true
      t.belongs_to :cart, null: false, foreign_key: true

      t.timestamps
    end
  end

  def down
    remove_table :line_items
  end
end

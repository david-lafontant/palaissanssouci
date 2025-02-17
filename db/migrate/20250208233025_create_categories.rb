class CreateCategories < ActiveRecord::Migration[8.0]
  def up
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end
  end

  def down
    remove_table :categories
  end
end

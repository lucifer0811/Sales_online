class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.integer :sale_off
      t.string :description
      t.references :category

      t.timestamps null: false
    end
  end
end

class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :quantity
      t.decimal :price
      t.references :product
      t.references :order

      t.timestamps null: false
    end
  end
end

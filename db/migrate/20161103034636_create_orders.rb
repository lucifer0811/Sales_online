class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :code
      t.integer :number_item
      t.string :total_price
      t.references :user

      t.timestamps null: false
    end
  end
end

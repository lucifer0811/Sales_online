class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :product_name
      t.decimal :price
      t.integer :status
      t.references :user

      t.timestamps null: false
    end
  end
end

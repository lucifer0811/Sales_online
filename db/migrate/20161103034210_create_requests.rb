class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :product_name
      t.decimal :price
      t.boolean :is_approved, default: false
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
    add_index :requests, [:user_id, :created_at]
  end
end

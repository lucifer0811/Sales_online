class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :uid
      t.decimal :duration
      t.datetime :ziggeo_created_at
      t.boolean :approved, default: false
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
  # add_index :videos, :uid, unique: true
end

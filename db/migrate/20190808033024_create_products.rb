class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false, index: true
      t.integer :artist_id, null: false
      t.integer :label_id, null: false
      t.integer :genre_id, null: false
      t.integer :price, null: false
      t.integer :stock, null: false
      t.text :jacket_image_id
      t.text :summary
      t.boolean :product_deleted, null: false, default: false

      t.timestamps
    end
  end
end

class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.integer :product_id, null: false
      t.integer :disc, null: false, default: 1
      t.integer :number, null: false
      t.string :name, null: false
      t.string :length, null: false

      t.timestamps
    end
  end
end

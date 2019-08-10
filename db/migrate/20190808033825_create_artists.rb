class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name, null: false, index: true, unique: true

      t.timestamps
    end
  end
end

class CreateConsts < ActiveRecord::Migration[5.2]
  def change
    create_table :consts do |t|
      t.string :name, null: false
      t.integer :value, null: false

      t.timestamps
    end
  end
end

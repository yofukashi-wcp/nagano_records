class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id, null: false
      t.string :zip_code, null:false
      t.string :address, null: false
      t.string :phone_number, null: false
      t.integer :postage, null: false
      t.integer :total, null: false
      t.integer :payment, null: false, default: 0
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end

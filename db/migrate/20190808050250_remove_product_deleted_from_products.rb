class RemoveProductDeletedFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :product_deleted, :boolean
  end
end

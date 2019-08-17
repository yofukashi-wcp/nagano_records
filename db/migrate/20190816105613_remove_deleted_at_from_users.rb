class RemoveDeletedAtFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :deleted_at, :boolean
  end
end

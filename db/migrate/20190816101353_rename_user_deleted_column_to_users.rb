class RenameUserDeletedColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :user_deleted, :deleted_at
  end
end

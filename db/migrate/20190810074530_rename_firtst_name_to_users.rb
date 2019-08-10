class RenameFirtstNameToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :firtst_name, :first_name
  end
end

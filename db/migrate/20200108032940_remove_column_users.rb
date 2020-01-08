class RemoveColumnUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :avatar, :string
    remove_column :users, :token, :string
  end
end

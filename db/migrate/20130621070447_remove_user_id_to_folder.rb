class RemoveUserIdToFolder < ActiveRecord::Migration
  def up
    remove_column :folders, :user_id
  end

  def down
    add_column :folders, :user_id, :integer
  end
end

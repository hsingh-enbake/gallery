class RemoveUserIdFromFolder < ActiveRecord::Migration
  def up
    remove_column :folders, :user_id
  end

  def down
  end
end

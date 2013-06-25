class AddReferencesToFolder < ActiveRecord::Migration
def change
   change_table :folders do |t|
    t.references :user
  end
  add_index :folders, :user_id 
  end
end

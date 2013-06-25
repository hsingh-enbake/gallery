class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :folder

      t.timestamps
    end
    add_index :photos, :folder_id
  end
end

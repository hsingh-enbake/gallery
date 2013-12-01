class CreateExibitions < ActiveRecord::Migration
  def change
    create_table :exibitions do |t|
      t.string :name
      t.float :price

      t.timestamps
    end
  end
end

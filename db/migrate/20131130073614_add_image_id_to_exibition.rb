class AddImageIdToExibition < ActiveRecord::Migration
  def change
    add_column :exibitions, :image_id, :integer
  end
end

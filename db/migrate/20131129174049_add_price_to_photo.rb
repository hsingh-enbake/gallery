class AddPriceToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :price, :float
  end
end

class Exibition < ActiveRecord::Base
  attr_accessible :name, :price, :image_id
  
  has_one :photo
end

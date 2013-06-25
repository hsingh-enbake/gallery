class Folder < ActiveRecord::Base
  attr_accessible :album_name
 
  belongs_to :user
   
   validates :album_name, :presence=> true
  
  has_many :photos, :dependent => :destroy
   
    accepts_nested_attributes_for :photos, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end

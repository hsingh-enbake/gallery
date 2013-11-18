class Folder < ActiveRecord::Base
  attr_accessible :album_name
 
  belongs_to :user
   
   validates :album_name, :presence=> true

  has_reputation :like, 
        :source => :user, 
        :aggregated_by => :sum 

      has_reputation :unlike, 
        :source => :user, 
        :aggregated_by => :sum 
  has_many :photos, :dependent => :destroy
   
    accepts_nested_attributes_for :photos, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end

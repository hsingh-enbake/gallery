class Photo < ActiveRecord::Base
  belongs_to :folder 
  belongs_to :exibition

  attr_accessible :avatar, :avatar_file_name, :tag_list, :price
  acts_as_taggable 

  validates_attachment :avatar, :presence => true
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/image/missing.png"
end

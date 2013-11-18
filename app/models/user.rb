class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   
    has_many :folders, :dependent => :destroy
    
    has_reputation :votes, 
        :source => { :reputation => :folder_likes }, 
        :source => { :reputation => :folder_unlikes} 

      has_reputation :folder_likes, 
        :source => { :reputation => :like, :of => :folders } 
      has_reputation :folder_unlikes, 
        :source => { :reputation => :unlike, :of => :folders } 
  # Setup accessible (or protected) attributes for your model
  
   accepts_nested_attributes_for :folders, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
    
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
end
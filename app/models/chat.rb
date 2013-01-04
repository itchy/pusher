class Chat < ActiveRecord::Base
  attr_accessible :title
  has_many :topics
  validates :title, :presence => true, :length => { :minimum => 3 }
end

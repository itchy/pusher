class Chat < ActiveRecord::Base
  attr_accessible :title
  has_many :topics
  
end

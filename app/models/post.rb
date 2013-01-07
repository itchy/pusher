class Post < ActiveRecord::Base
  attr_accessible :content, :topic_id
  belongs_to :topic
  
  # validates :content , :presence=> true, :length => { :minimum => 3 }
end

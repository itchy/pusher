class Post < ActiveRecord::Base
  attr_accessible :content, :topic_id
end

class Topic < ActiveRecord::Base
  attr_accessible :chat_id, :rating, :status, :title
end

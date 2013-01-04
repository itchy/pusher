class Topic < ActiveRecord::Base
  attr_accessible :chat_id, :title # :rating, :status
  belongs_to :chat
end

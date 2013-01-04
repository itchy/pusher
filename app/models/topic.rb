class Topic < ActiveRecord::Base
  attr_accessible :chat_id, :title # :rating, :status
  belongs_to :chat
  validates :title, :presence => true, :length => { :minimum => 3 }
  validate :validate_chat_existance
  
  def new?
    false
  end
  
  private
    def validate_chat_existance
      errors.add(:chat_id, "Cannot be blank.") unless (chat_id)
      errors.add(:chat_id, "Must reference a valid Chat.") unless (chat)
    end
end

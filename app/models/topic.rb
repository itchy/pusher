class Topic < ActiveRecord::Base
  attr_accessor :new
  attr_accessible :chat_id, :title # :rating, :status
  belongs_to :chat
  has_many :posts
  
  validates :title, :presence => true, :length => { :minimum => 3 }
  validate :validate_chat_existance
  validates :status, :inclusion => { :in => [0,1,2] }
  validates_uniqueness_of :status, :scope => :chat_id,  :if => Proc.new { |topic| topic.active? }
  
   
  def new?
    @new
  end
  
  def unaddressed?
    status == 0
  end
  
  def self.unaddressed
    find_all_by_status(0)
  end
  
  def activate
    close_active_topic
    self.status = 1
    save!
  end
  
  def active?
    status == 1
  end
  
  def self.active
    find_by_status(1)
  end
  
  def close
    self.status = 2
    save
  end
  
  def addressed?
    status == 2
  end
  
  def self.addressed
    find_all_by_status(2)
  end
  
  private
    def validate_chat_existance
      errors.add(:chat_id, "Cannot be blank.") unless (chat_id)
      errors.add(:chat_id, "Must reference a valid Chat.") unless (chat)
    end  
    
    def close_active_topic
      c = chat
      a = chat.topics.active
      a.close if a
    end
end

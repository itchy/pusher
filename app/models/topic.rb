class Topic < ActiveRecord::Base
  attr_accessor :new
  attr_accessible :chat_id, :title # :rating, :status
  belongs_to :chat
  has_many :posts
  
  # scope :active_posts, :conditions => ["posts.active = 1"]
  
  validates :title, :presence => true, :length => { :minimum => 3 }
  validate :validate_chat_existance
  # validates :status, :inclusion => { :in => [0,1,2] }
  # validates_uniqueness_of :status, :scope => :chat_id,  :if => Proc.new { |topic| topic.active? }
  
   
  def new?
    @new
  end
  
  def open?
    status == 0
  end
  
  def active?
    status == 1
  end
  
  def closed?
    status == 2
  end
  
  private
    def validate_chat_existance
      errors.add(:chat_id, "Cannot be blank.") unless (chat_id)
      errors.add(:chat_id, "Must reference a valid Chat.") unless (chat)
    end
end

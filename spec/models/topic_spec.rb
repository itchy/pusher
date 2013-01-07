require 'spec_helper'

describe Topic do
  before(:each) do
     @chat = Chat.new(:title => "Test Chat")
     @chat.save
   end
  it "should require the existance of its referenced chat" do
    t = Topic.new(:title => "Test topic", :chat_id => 132134)
    t.should_not be_valid
  end
  
  it "should validate the presence of topic" do
    t = @chat.topics.new()
    t.should_not be_valid
  end
  
  it "should validate the existance of chat" do
    t = @chat.topics.new(:title => "Valid topic")
    t.should be_valid
  end
  
  it "should validate status is 0,1 or 2" do
    t = @chat.topics.new(:title => "topic")
    t.status = 3
    t.should_not be_valid
    t.status = 2
    t.should be_valid
  end
  
  context "multiple chats" do
    before(:each) do
       @alt_chat = Chat.new(:title => "Alt Test Chat")
       @alt_chat.save
       @first = @chat.topics.new(:title => "First Active topic")
       @first.status = 1
       @first.save
     end
    
    
    it "should only have one active post" do
      @first.should be_valid
      second = @chat.topics.new(:title => "Second Active topic")
      second.status = 1
      second.should_not be_valid
    end
  
    it "should allow active posts accross multiple chats" do
      second = @alt_chat.topics.new(:title => "Active topic in second chat")
      second.status = 1
      second.should be_valid
    end
  end # multiple chats

end

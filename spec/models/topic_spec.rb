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
end

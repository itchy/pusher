require 'spec_helper'

describe Post do
  before(:each) do
     @chat = Chat.new(:title => "Test Chat")
     @chat.save
     @topic = @chat.topics.new(:title => "Valid topic")
     @topic.save
   end
  
  it "should validate the presence of content" do
    p = @topic.posts.new(:content => "")
    p.should_not be_valid
  end
  it "should validate the presence of content" do
    p = @topic.posts.new(:content => "Sample content")
    p.should be_valid
  end
end

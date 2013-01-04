require 'spec_helper'

describe Chat do
  it "should validate the presence of topic" do
    c = Chat.new()
    c.should_not be_valid
  end
  it "should validate the presence of topic" do
    c = Chat.new(:title => "Sample test title")
    c.should be_valid
  end
end

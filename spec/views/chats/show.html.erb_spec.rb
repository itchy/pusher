require 'spec_helper'

describe "chats/show" do
  before(:each) do
    @chat = assign(:chat, stub_model(Chat,
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
  end
end

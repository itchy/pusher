require 'spec_helper'

describe "chats/index" do
  before(:each) do
    assign(:chats, [
      stub_model(Chat,
        :title => "Title"
      ),
      stub_model(Chat,
        :title => "Title"
      )
    ])
  end

  it "renders a list of chats" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end

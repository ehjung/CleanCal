require 'spec_helper'

describe "tasks/index" do
  before(:each) do
    assign(:tasks, [
      stub_model(Task,
        :action => "Action"
      ),
      stub_model(Task,
        :action => "Action"
      )
    ])
  end

  it "renders a list of tasks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Action".to_s, :count => 2
  end
end

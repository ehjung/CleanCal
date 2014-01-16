require 'spec_helper'

describe "roommates/new" do
  before(:each) do
    assign(:roommate, stub_model(Roommate,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new roommate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", roommates_path, "post" do
      assert_select "input#roommate_name[name=?]", "roommate[name]"
    end
  end
end

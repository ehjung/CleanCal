require 'spec_helper'

describe "roommates/edit" do
  before(:each) do
    @roommate = assign(:roommate, stub_model(Roommate,
      :name => "MyString"
    ))
  end

  it "renders the edit roommate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", roommate_path(@roommate), "post" do
      assert_select "input#roommate_name[name=?]", "roommate[name]"
    end
  end
end

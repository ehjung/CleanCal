require 'spec_helper'
include Devise::TestHelpers

describe RoommatesController do

    it "GET new" do
      get :new
      response.should be_success
    end

    it "GET show" do
    	get :show, {id: 1}
    	response.should redirect_to roommates_path
    end

    it "GET destroy" do
    	new_roommate = create(:roommate)
      	delete :destroy, id: new_roommate.id
    	response.should be_success
    end

end

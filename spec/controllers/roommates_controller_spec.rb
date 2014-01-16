require 'spec_helper'

describe RoommatesController do

    it "should be able to make a new roommate" do
      get :new
      response.should be_success
    end

end

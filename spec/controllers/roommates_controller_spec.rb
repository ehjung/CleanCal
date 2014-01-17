require 'spec_helper'

describe RoommatesController do

    it "should GET new" do
      get :new
      response.should be_success
    end

    it "should GET create" do
    	get :create
    	response.should be_success
    end

end

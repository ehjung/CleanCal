require 'spec_helper'

describe RoommatesController do

    it "GET new" do
      get :new
      response.should be_success
    end

    it "POST create" do
    	post :create, name: 'test'
    	response.should be_success
    end

end

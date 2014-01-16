require 'spec_helper'

describe RoommatesController do

  describe "GET 'name:string'" do
    it "returns http success" do
      get 'name:string'
      response.should be_success
    end
  end

end

require "spec_helper"

describe RoommatesController do
  describe "routing" do

    it "routes to #index" do
      get("/roommates").should route_to("roommates#index")
    end

    it "routes to #new" do
      get("/roommates/new").should route_to("roommates#new")
    end

    it "routes to #show" do
      get("/roommates/1").should route_to("roommates#show", :id => "1")
    end

    it "routes to #edit" do
      get("/roommates/1/edit").should route_to("roommates#edit", :id => "1")
    end

    it "routes to #create" do
      post("/roommates").should route_to("roommates#create")
    end

    it "routes to #update" do
      put("/roommates/1").should route_to("roommates#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/roommates/1").should route_to("roommates#destroy", :id => "1")
    end

  end
end

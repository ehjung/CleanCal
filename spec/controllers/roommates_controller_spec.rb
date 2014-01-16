require 'spec_helper'

describe RoommatesController do

  # This should return the minimal set of attributes required to create a valid
  # Roommate. As you add validations to Roommate, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RoommatesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all roommates as @roommates" do
      roommate = Roommate.create! valid_attributes
      get :index, {}, valid_session
      assigns(:roommates).should eq([roommate])
    end
  end

  describe "GET show" do
    it "assigns the requested roommate as @roommate" do
      roommate = Roommate.create! valid_attributes
      get :show, {:id => roommate.to_param}, valid_session
      assigns(:roommate).should eq(roommate)
    end
  end

  describe "GET new" do
    it "assigns a new roommate as @roommate" do
      get :new, {}, valid_session
      assigns(:roommate).should be_a_new(Roommate)
    end
  end

  describe "GET edit" do
    it "assigns the requested roommate as @roommate" do
      roommate = Roommate.create! valid_attributes
      get :edit, {:id => roommate.to_param}, valid_session
      assigns(:roommate).should eq(roommate)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Roommate" do
        expect {
          post :create, {:roommate => valid_attributes}, valid_session
        }.to change(Roommate, :count).by(1)
      end

      it "assigns a newly created roommate as @roommate" do
        post :create, {:roommate => valid_attributes}, valid_session
        assigns(:roommate).should be_a(Roommate)
        assigns(:roommate).should be_persisted
      end

      it "redirects to the created roommate" do
        post :create, {:roommate => valid_attributes}, valid_session
        response.should redirect_to(Roommate.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved roommate as @roommate" do
        # Trigger the behavior that occurs when invalid params are submitted
        Roommate.any_instance.stub(:save).and_return(false)
        post :create, {:roommate => { "name" => "invalid value" }}, valid_session
        assigns(:roommate).should be_a_new(Roommate)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Roommate.any_instance.stub(:save).and_return(false)
        post :create, {:roommate => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested roommate" do
        roommate = Roommate.create! valid_attributes
        # Assuming there are no other roommates in the database, this
        # specifies that the Roommate created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Roommate.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => roommate.to_param, :roommate => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested roommate as @roommate" do
        roommate = Roommate.create! valid_attributes
        put :update, {:id => roommate.to_param, :roommate => valid_attributes}, valid_session
        assigns(:roommate).should eq(roommate)
      end

      it "redirects to the roommate" do
        roommate = Roommate.create! valid_attributes
        put :update, {:id => roommate.to_param, :roommate => valid_attributes}, valid_session
        response.should redirect_to(roommate)
      end
    end

    describe "with invalid params" do
      it "assigns the roommate as @roommate" do
        roommate = Roommate.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Roommate.any_instance.stub(:save).and_return(false)
        put :update, {:id => roommate.to_param, :roommate => { "name" => "invalid value" }}, valid_session
        assigns(:roommate).should eq(roommate)
      end

      it "re-renders the 'edit' template" do
        roommate = Roommate.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Roommate.any_instance.stub(:save).and_return(false)
        put :update, {:id => roommate.to_param, :roommate => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested roommate" do
      roommate = Roommate.create! valid_attributes
      expect {
        delete :destroy, {:id => roommate.to_param}, valid_session
      }.to change(Roommate, :count).by(-1)
    end

    it "redirects to the roommates list" do
      roommate = Roommate.create! valid_attributes
      delete :destroy, {:id => roommate.to_param}, valid_session
      response.should redirect_to(roommates_url)
    end
  end

end

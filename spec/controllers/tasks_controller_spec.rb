require 'spec_helper'

describe TasksController do

	it 'GET new' do
		get :new
		response.should be_success
	end
end

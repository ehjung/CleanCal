require 'spec_helper'

describe Roommate do

	it 'should be able to make a roommate with a name' do
		new_roommate = Roommate.new(name: 'test')
		expect(new_roommate.should_not == nil)
	end
=begin
	it 'should not be able to make a roommate without a name' do
		new_roommate = Roommate.new
		expect(new_roommate.should == nil)
	end
=end
end

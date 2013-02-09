require 'spec_helper'

describe User do

	it 'creates a user with valid attributes' do
		user = User.new(full_name: 'Lucy Example', email: 'lucym123@example.com', password: 'secret')
		user.should be_valid
	end

	it "is invalid without a full name" do
		user = User.new(full_name: '', email: 'lucym123@example.com', password: 'secret')
		user.should_not be_valid
	end

end

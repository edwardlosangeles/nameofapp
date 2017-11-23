# 20171112 6.2 Unit Tests

require 'rails_helper'

describe User, type: :model do
	
	# 20171120 6.4 Generating Test Data
	it "should not validate users without an email address" do
		@user = FactoryBot.build(:user, email: "not_an_email")
		expect(@user).to_not be_valid

	end
end
# 20171120 6.4 Generating Test Data

FactoryBot.define do
	
	sequence(:email) { |n| "testing#{n}@example.com" }

	factory :user, class: User do
		email
		password "1234567890"
		first_name "peter1"
		last_name "example"
		admin false
	end


end
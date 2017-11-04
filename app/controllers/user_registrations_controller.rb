# 20171104 5.11 ED Automated Email on User Sign Up

class UserRegistrationsController < Devise::RegistrationsController
	def create
		super
		if @user.persisted?
			UserMailer.welcome(@user).deliver_now
		end
	end
end

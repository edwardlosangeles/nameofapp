# 20170921 ED 5.3 Sending Emails
# file generated from the following terminal command:
#  $ rails generate mailer UserMailer

class UserMailer < ApplicationMailer
	# if a sender isn't specified, then it will default to this
	default from: "edwardlosangeles@gmail.com"

	# this will be called in static_pages_controller thank_you action to replace ActionMailer
	def contact_form(email, name, message)
		@message = message
		mail(from: email,
			to: 'edwardlosangeles@gmail.com',
			subject: "A new contact form message from #{name}")
	end

	# 20171104 5.11 ED Automated Email on User Sign Up
	def welcome(user)
		@appname = "EpicEdward.com"
		mail(to: user.email,
			subject: "Welcome to #{@appname}!")
	end


end

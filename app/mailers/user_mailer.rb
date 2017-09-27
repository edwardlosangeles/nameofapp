# 20170921 ED 5.3 Sending Emails
# file generated from the following terminal command:
#  $ rails generate mailer UserMailer

class UserMailer < ApplicationMailer
	# if an invalid email address used by sender, then this will be used
	default from: "erroredwardlosangeles@gmail.com"

	# this will be called in static_pages_controller thank_you action to replace ActionMailer
	def contact_form(email, name, message)
		@message = message
		mail(from: email,
			to: 'edwardlosangeles@gmail.com',
			subject: "A new contact form message from #{name}")
	end
end

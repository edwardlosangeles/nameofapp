# 20170921 ED 5.3 Sending Emails
# this file was generated automatically from $ rails generate mailer UserMailer
# along with test/mailers/user_mailer_test.rb
# from a test app that was created with the default test suite, ie -T omitted
# then dragged over to this app

# Preview all emails at http://localhost:3000/rails/mailers/user_mailer

class UserMailerPreview < ActionMailer::Preview

	# you can call same method(contact_form) defined in app/mailers/user_mailer.rb:
	# to go directly to rendered email:
	# def can be named anything (eg def contactform)
	# and it will show up as a link in 
	# http://localhost:3000/rails/mailers/user_mailer
	# you may go to rendered email directly
	# http://localhost:3000/rails/mailers/user_mailer/contactform
	def contactform
		emailname = "Edward"
		emailaddress = "edward@example.com"
		emailmessage = "hello to you guys at nameofapp!"
		UserMailer.contact_form(emailaddress, emailname, emailmessage)
	end

	def welcome
		emailto = User.last
		UserMailer.welcome(emailto)
	end

end

class UserMailerPreview < ActionMailer::Preview

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

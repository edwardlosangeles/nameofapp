class UserMailer < ApplicationMailer
  # if a sender isn't specified, then it will default to this
  default from: "edwardlosangeles@gmail.com"

  def contact_form(email, name, message)
    @message = message
    mail(from: email,
      to: 'edwardlosangeles@gmail.com',
      subject: "A new contact form message from #{name}")
  end

  def welcome(user)
    @appname = "EpicEdward.com"
    mail(to: user.email,
      subject: "Welcome to #{@appname}!")
  end

end

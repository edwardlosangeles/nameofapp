class ApplicationMailer < ActionMailer::Base

  # 20170921 ED 5.3 Sending Emails
  # # this doesn't seem to be used if the sender enters a wrong email address 
  default from: "erroredwardlosangeles@gmail.com"
  layout 'mailer'

end

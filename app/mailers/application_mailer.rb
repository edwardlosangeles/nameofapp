class ApplicationMailer < ActionMailer::Base

  # 20170921 ED 5.3 Sending Emails
  # if an invalid email address used by sender, then this will be used 
  default from: "erroredwardlosangeles@gmail.com"
  layout 'mailer'

end

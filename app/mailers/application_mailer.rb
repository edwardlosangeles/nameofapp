class ApplicationMailer < ActionMailer::Base

  # 20170921 ED 5.3 Sending Emails
  # if a sender isn't specified, then it will default to this
  default from: "edwardlosangeles@gmail.com"
  layout 'mailer'

end

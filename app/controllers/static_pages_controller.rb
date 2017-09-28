class StaticPagesController < ApplicationController
  def index
  end
  def about
  end
  def contact
  end

  # 20170921 ED 5.3 Sending Emails
  def thank_you
  	# these 3 params were retrieved from /views/static_pages/contact.html.erb
  	#  eg params[:email] refers to form.text_field :email
	@name = params[:name]
	@email = params[:email]
	@message = params[:message]

	# /views/user_mailer/contact_form.html.erb is the template used for email
	# def contact_form found here: /app/mailers/user_mailer.rb
  UserMailer.contact_form(@email, @name, @message).deliver_now

	# replaced by UserMailer.contact_form
	# ActionMailer::Base.mail(from: @email,
	# 					to: 'edwardlosangeles@gmail.com',
	# 					subject: "A new contact form message from #{@name}",
	# 					body: @message).deliver_now

  end

  def landing_page
  	@products = Product.limit(3)
  end

end

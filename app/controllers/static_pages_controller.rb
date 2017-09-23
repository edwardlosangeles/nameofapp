class StaticPagesController < ApplicationController
  def index
  end
  def about
  end
  def contact
  end

  # 20170921 ED 5.3 Sending Emails
  def thank_you
	@name = params[:name]
	@email = params[:email]
	@message = params[:message]

	ActionMailer::Base.mail(from: @email,
						to: 'edwardlosangeles@gmail.com',
						subject: "A new contact form message from #{@name}",
						body: @message).deliver_now
  end

  def landing_page
  	@products = Product.limit(3)
  end

end

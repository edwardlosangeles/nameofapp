# 20171129 6.6: Creating Payments
# $ rails generate controller payments

class PaymentsController < ApplicationController

	before_action :authenticate_user!

	# POST /payments
	def create
		
		@product = Product.find_by(id: params[:product_id])

		@user = current_user

		Stripe.api_key = Rails.configuration.stripe[:secret_key]

		token = params[:stripeToken]
		# create the charge on Stripe's servers - this will charge the user's card
		begin
			charge = Stripe::Charge.create(
				amount: @product.price_in_cents, # amount in cents, again
				currency: "usd",
				source: token,
				description: params[:stripeEmail],
				receipt_email: params[:stripeEmail]
			)

			if charge.paid
				Order.create!(user_id: @user.id, product_id: @product.id, total_in_cents: @product.price_in_cents)
			end

			rescue Stripe::CardError => e
				# The card has been declined
				body = e.json_body
				err = body[:error]
				flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
			rescue Stripe::RateLimitError => e
			  # Too many requests made to the API too quickly
			  body = e.json_body
			  err = body[:error]
			  flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
			rescue Stripe::InvalidRequestError => e
			  # Invalid parameters were supplied to Stripe's API
			  body = e.json_body
			  err = body[:error]
			  flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
			rescue Stripe::AuthenticationError => e
			  # Authentication with Stripe's API failed
			  # (maybe you changed API keys recently)
			  body = e.json_body
			  err = body[:error]
			  flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
			rescue Stripe::APIConnectionError => e
			  # Network communication with Stripe failed
			  body = e.json_body
			  err = body[:error]
			  flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
			rescue Stripe::StripeError => e
			  # Display a very generic error to the user, and maybe send
			  # yourself an email
			  body = e.json_body
			  err = body[:error]
			  flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
			rescue => e
			  # Something else happened, completely unrelated to Stripe
			  body = e.json_body
			  err = body[:error]
			  flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
		end
		redirect_to product_path(@product), notice: 'Thank you for your purchase'
	end

end
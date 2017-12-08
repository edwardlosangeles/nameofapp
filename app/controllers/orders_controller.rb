class OrdersController < ApplicationController
	
	# 20170929 ED 5.4 authentication
	# devise: only logged in users will be able to see orders views
	before_action :authenticate_user!

	def index
		
		# 20171129 6.6: Creating Payments
		if signed_in? && current_user.admin?
			@orders = Order.all
		else
			@orders = Order.where(user_id: current_user.id)
		end

	end
	
	def show
	end
	
	def new
	end
	
	def create
	end

	def destroy
	end



end
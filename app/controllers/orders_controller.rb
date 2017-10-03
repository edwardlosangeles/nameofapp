class OrdersController < ApplicationController
	def index
	end
	
	def show
	end
	
	def new
	end
	
	def create
	end

	def destroy
	end

	# 20170929 ED 5.4 authentication
	# devise: only logged in users will be able to see orders views
	before_action :authenticate_user!

end
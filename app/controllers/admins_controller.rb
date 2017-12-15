# 20171208 Admin Controller, personal project
class AdminsController < ApplicationController
	
	before_action :authenticate_user!, :isadmin
		
	def index
		@products = Product.all
		@users = User.all
		@orders = Order.all
		@comments = Comment.all
	end

	private

		def isadmin
			if !current_user.admin?
				redirect_to root_path, alert: 'You must be an admin to access this section'
			end
		end

end
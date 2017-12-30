# 20171224 6.13: Real-Time Updates with ActionCable
module ApplicationCable
  class Connection < ActionCable::Connection::Base
  	
  	# 20171228 6.14: ActiveJob and Advanced ActionCable
  	identified_by :current_user

  	def connect
  		self.current_user = find_verified_user
  	end

  	def disconnect

  	end

  	protected

  		def find_verified_user
  			if verified_user = request.env['warden'].user
  				verified_user
  			else
  				reject_unauthorized_connection
  			end
  		end

  end
end

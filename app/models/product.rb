class Product < ApplicationRecord
	has_many :orders


	# ED 20170918 search form
	# created this for index action in products controller to call on
	def self.search(search_term)
		
		#In Postgres/Heroku LIKE is case sensitive, so use ilike
		#use Rails.env.development? to check if you're in local
		#use Rails.env.production? to check if you're in heroku
		if Rails.env.development?
			#puts "we in the dev
			Product.where("name LIKE ?", "%#{search_term}%")
		else
			#puts "we in the prod"
			Product.where("name ilike ?", "%#{search_term}%")
		end
	end








end


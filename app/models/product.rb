class Product < ApplicationRecord
	has_many :orders

	#20171005 ED 5.7 Comment Model
	has_many :comments	

	#20171022 5.9 Validation & Pagination
	#Name field needs to be populated when creating a new product
	validates :name, presence: true

	# ED 20170918 search form
	# created this for index action in products controller to call on
	def self.search(search_term)
		
		#In Postgres/Heroku LIKE is case sensitive, so use ilike
		#use Rails.env.development? to check if you're in local
		#use Rails.env.production? to check if you're in heroku
		if Rails.env.development?
			#puts "we in the dev"
			Product.where("name LIKE ?", "%#{search_term}%")
		else
			#puts "we in the prod"
			Product.where("name ilike ?", "%#{search_term}%")
		end
	end

	#20171005 ED 5.7 Comment Model
	#get highest rated and lowest rated comment for a product
	def highest_rating_comment
		comments.rating_desc.first
	end

	def lowest_rating_comment
		comments.rating_asc.first
	end

	#20171017 5.8 Comments Controller & Views
	def average_rating
		comments.average(:rating).to_f
	end

end

# 20170929 ED 5.4 authentication

class User < ApplicationRecord
  
	# $ rails g devise User
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
    	   :recoverable, :rememberable, :trackable, :validatable

   	# $ rails generate scaffold user first_name last_name
   	# add relations between user and order models
	has_many :orders

	#20171005 ED 5.7 Comment Model
	has_many :comments
	
end

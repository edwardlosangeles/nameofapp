# 20170929 ED 5.4 authentication
# $ rails generate scaffold user first_name last_name

class User < ApplicationRecord
  
	# 20170929 ED 5.4 authentication
	# $ rails g devise User
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
    	   :recoverable, :rememberable, :trackable, :validatable


	has_many :orders
end

class Order < ApplicationRecord
  belongs_to :product
  
  # 20170929 ED 5.4 authentication
  # $ rails generate scaffold user first_name last_name
  # add relations between user and order models
  belongs_to :user
end
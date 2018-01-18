class Product < ApplicationRecord
  has_many :orders

  has_many :comments  

  validates :name, presence: true

  def self.search(search_term)
    
    #In Postgres/Heroku LIKE is case sensitive, so use ilike
    #use Rails.env.development? to check if you're in local
    #use Rails.env.production? to check if you're in heroku
    if Rails.env.development?
      Product.where("name LIKE ?", "%#{search_term}%")
    else
      Product.where("name ilike ?", "%#{search_term}%")
    end
  end

  def highest_rating_comment
    comments.rating_desc.first
  end

  def lowest_rating_comment
    comments.rating_asc.first
  end

  def average_rating
    comments.average(:rating).to_f
  end

  def views
    $redis.get("product:#{id}") # this is equivalent to 'GET product:1'
  end

  def viewed!
    $redis.incr("product:#{id}") # this is equivalent to 'INC product:1'
  end

end

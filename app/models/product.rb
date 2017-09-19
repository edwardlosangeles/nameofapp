class Product < ApplicationRecord
	has_many :orders



# ED 20170918 search form
def self.search(search_term)
	Product.where("name LIKE ?", "%#{search_term}%")
end





end


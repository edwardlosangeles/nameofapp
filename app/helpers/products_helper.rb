module ProductsHelper

	# 20171220 6.11: Caching
	def cache_key_for_products
		count = Product.count
		max_updated_at = Product.maximum(:updated_at).try(:utc).try(:to_s, :number)
		"products/all-#{count}-#{max_updated_at}"
	end

	
end

Rails.application.routes.draw do
 
	resources :products

	get 'static_pages/about'
	get 'static_pages/contact'
	get 'static_pages/index'

	#ED 20170915 just for 5.1, needed to create dynamic link for featured items in static_pages index
	get 'static_pages/landing_page'
	
	#ED 20170915 just for 5.1, I changed original root page from landing to products
	#root 'products#index'

	root 'static_pages#landing_page'

  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  	resources :orders, only: [:index, :show, :create, :destroy]
  
end

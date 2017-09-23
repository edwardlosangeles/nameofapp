Rails.application.routes.draw do

# eg. $ rails routes:
#
#                    Prefix Verb   URI Pattern                          Controller#Action
#                  products GET    /products(.:format)                  products#index
#                           POST   /products(.:format)                  products#create
#               new_product GET    /products/new(.:format)              products#new
#              edit_product GET    /products/:id/edit(.:format)         products#edit
#                   product GET    /products/:id(.:format)              products#show
#                           PATCH  /products/:id(.:format)              products#update
#                           PUT    /products/:id(.:format)              products#update
#                           DELETE /products/:id(.:format)              products#destroy
#
#        static_pages_about GET    /static_pages/about(.:format)        static_pages#about
#      static_pages_contact GET    /static_pages/contact(.:format)      static_pages#contact
#        static_pages_index GET    /static_pages/index(.:format)        static_pages#index
# static_pages_landing_page GET    /static_pages/landing_page(.:format) static_pages#landing_page
#                      root GET    /                                    static_pages#landing_page
#
#                    orders GET    /orders(.:format)                    orders#index
#                           POST   /orders(.:format)                    orders#create
#                     order GET    /orders/:id(.:format)                orders#show
#                           DELETE /orders/:id(.:format)                orders#destroy

	resources :products

	get 'static_pages/about'
	get 'static_pages/contact'
	get 'static_pages/index'

	#ED 20170915 just for 5.1, needed to create dynamic link for featured items in static_pages index
	get 'static_pages/landing_page'
	
	# 20170921 ED 5.3 Sending Emails
	post 'static_pages/thank_you'

	root 'static_pages#landing_page'

  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  	resources :orders, only: [:index, :show, :create, :destroy]
  
end

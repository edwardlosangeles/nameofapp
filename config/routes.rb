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
	


	# 20170929 ED 5.4 authentication
	# $ rails g devise users
	Rails.application.routes.draw do
	# default routes for signing in and out are /users/sign_in & /users/sign_out, but they can be changed
	# eg instead http://localhost:3000/users/sign_in you can use http://localhost:3000/login
	# http://localhost:3000/logout will not work if you enter into browser address but the address works when you click Logout button
	# more reading: https://github.com/plataformatec/devise/wiki/How-To:-Change-the-default-sign_in-and-sign_out-routes
	devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }
	# original
	#devise_for :users
	

	# 20170929 ED 5.4 authentication
	# $ rails generate scaffold user first_name last_name
	resources :users

	# 20171017 5.8 Comments Controller & Views
	# original:
	# resources :products
	resources :products do
		resources :comments
	end

	

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

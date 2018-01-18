Rails.application.routes.draw do

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }, controllers: { registrations: "user_registrations" }

  resources :users

  resources :products do
    resources :comments
  end

  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/index'

  get 'static_pages/landing_page'
  
  post 'static_pages/thank_you'

  root 'static_pages#landing_page'

  resources :orders, only: [:index, :show, :create, :destroy]
  
  post '/payments/create'

  get 'admins/index'

  mount ActionCable.server => '/cable'

end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # 20171005 ED 5.5 Authorization
  # handles the following error CanCan::AccessDenied in UsersController#edit
  rescue_from CanCan::AccessDenied do |exception|
  	redirect_to main_app.root_url, alert: exception.message
  end

end

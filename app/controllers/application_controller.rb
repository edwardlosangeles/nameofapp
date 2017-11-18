class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # 20171005 ED 5.5 Authorization
  # handles the following error CanCan::AccessDenied in UsersController#edit
  rescue_from CanCan::AccessDenied do |exception|

  	# 20171115 6.3 Functional Tests
  	# original
  	# redirect_to main_app.root_url, alert: exception.message
  	redirect_to new_user_session_path, alert: exception.message
  end

end

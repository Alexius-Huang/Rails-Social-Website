class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_in) do |u|
  	 u.permit(:email, :password)
  	end
  	devise_parameter_sanitizer.permit(:sign_up) do |u|
  	 u.permit(:name, :email, :password, :password_confirmation)
  	end
  	devise_parameter_sanitizer.permit(:account_update) do |u|
  	 u.permit(:name, :email, :password, :password_confirmation)
  	end
  end
end

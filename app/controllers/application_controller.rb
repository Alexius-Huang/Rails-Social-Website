class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password) }
  	devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
  	devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :self_intro, :blog_title, :motto, :avatar, :password, :password_confirmation, :current_password) }
  end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # skip_before_action :verify_authenticity_token
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  include ApplicationHelper
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) {
      |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) {
      |u| u.permit(:name, :email, :password, :current_password, :avatar) }
  end
end

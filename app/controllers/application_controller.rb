class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permited_parameters, if: :devise_controller?

  protected

  # define page to load on successful sign-in
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  def configure_permited_parameters
    added_attrs = [:username, :image, :email, :bio, :password, :password_confirmation, :remember_me, :role]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end

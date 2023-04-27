class ApplicationController < ActionController::Base
  include Pagy::Backend
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from CanCan::AccessDenied, with: :no_access

  before_action :configure_permitted_parameters, if: :devise_controller?
  # check_authorization unless: :devise_controller?
  # before_filter :authenticate_user!, unless: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :user_type) }

    devise_parameter_sanitizer.permit(:account_update) { |u|
      u.permit(:name, :email, :password, :current_password, :user_type)
    }
  end
  # end

  private

  def record_not_found
    redirect_to root_path, layout: true, status: :not_found
  end

  def no_access
    flash[:alert] = "You were not authorised for this project"
    redirect_to root_path, layout: true, status: :not_found
  end
end

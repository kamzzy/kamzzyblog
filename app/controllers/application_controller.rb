class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :null_session,
                       if: proc { |c| c.request.format == 'application/json' }

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :photo, :bio, :posts_counter, :email, :password, :password_confirmation, :role_id)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :photo, :bio, :posts_counter, :email, :password, :password_confirmation, :current_password,
               :role_id)
    end
  end
end

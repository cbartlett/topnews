class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # registration_params = [:first_name, :last_name, :email, :password, ]

    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password])

    # if params[:action] == 'create'
    #   devise_parameter_sanitizer.for(:sign_up) do
    #     |u| u.permit(registration_params)
    #   end
    # end  end
  end
end

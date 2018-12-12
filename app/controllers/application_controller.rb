class ApplicationController < ActionController::Base
	before_action :authenticate_user!

	rescue_from CanCan::AccessDenied do |exception|
        redirect_to '/', :alert => exception.message
    end

    #Abaixo configurações necessárias para usar outros atributos no devise

    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
        end
end

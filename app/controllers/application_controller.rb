class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    3    before_action :configure_permitted_parameters, if: devise_controller?
    4  
    5    protected
    6  
    7    def configure_permitted_parameters
    8      devise_parameter_sanitizer.permit(:sign_up, keys: %i[fname lname image])
    9      devise_parameter_sanitizer.permit(:account_update, keys: %i[fname lname image])
    10   end
end

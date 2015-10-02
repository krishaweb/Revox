class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  layout :layout_by_resource


  
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << [:fname, :lname, :image, :image_cache]
      devise_parameter_sanitizer.for(:account_update) << [:fname, :lname, :image, :image_cache]
    end

    def layout_by_resource
	  if devise_controller? && resource_name == :user && action_name == "new"
	    "register"
	  else
	    "application"
	  end
	end

end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session


 	after_filter :set_access_control_headers

	def set_access_control_headers 
		headers['Access-Control-Allow-Origin'] = '*' 
		headers['Access-Control-Request-Method'] = '*' 
		headers['Access-Control-Allow-Methods: GET, POST, PUT, OPTIONS'];
	end
	
end

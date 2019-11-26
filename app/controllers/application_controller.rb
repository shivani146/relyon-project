class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include EmployeeAuthentication
  protect_from_forgery with: :exception
  before_action :authenticate_employee!
  before_action :authentication,  only: [:index]

end

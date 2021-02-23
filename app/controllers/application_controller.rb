class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_action :set_current_user
  protect_from_forgery with: :exception
  protected
  def set_current_user
    # byebug
    @current_user ||= Moviegoer.find_by(:id => session[:user_id])
    redirect_to login_path and return unless @current_user
  end
 
end

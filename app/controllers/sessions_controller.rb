class SessionsController < ApplicationController
  skip_before_action :set_current_user, only: :create
  def create
    @current_user = Moviegoer.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = @current_user.id
    flash[:notice] = 'Logged in.'
    redirect_to movies_path
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    flash[:notice] = 'Logged out successfully.'
    redirect_to movies_path # Only for test, need another path for logout
  end

  def auth_hash
    request.env['omniauth.auth']
  end
end
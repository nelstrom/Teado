class ApplicationController < ActionController::Base
  include ControllerAuthentication
  protect_from_forgery
  helper_method :current_user

  def handle_unverified_request
    raise(ActionController::InvalidAuthenticityToken)
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    unless current_user
      flash[:notice] = "Login required"
      respond_to do |format|
        format.html { redirect_to login_url }
        format.json { render :json => { :message => "Access denied" } }
      end
    end
  end

end

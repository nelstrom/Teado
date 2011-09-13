class ApplicationController < ActionController::Base
  include ControllerAuthentication
  protect_from_forgery

  def handle_unverified_request
    raise(ActionController::InvalidAuthenticityToken)
  end

end

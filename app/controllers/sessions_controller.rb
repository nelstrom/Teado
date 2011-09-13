class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:username], params[:password])
    respond_to do |format|
      if user
        session[:user_id] = user.id
        format.html { redirect_to_target_or_default root_url, :notice => "Logged in successfully." }
        format.json { render :json => user, :status => :created }
      else
        format.html do
          flash.now[:alert] = "Invalid login or password."
          render :action => 'new'
        end
        format.json { render :json => {}, :status => :fail }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "You have been logged out."
  end
end

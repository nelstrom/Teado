class UsersController < ApplicationController
  before_filter :login_required, :except => [:new, :create, :current]

  def current
    respond_to do |format|
      if @user = current_user
        format.json { render :json => { :current_users => [{:username => @user.username, :active => true}] } }
      else
        format.json { render :json => { :current_users => [{:active => false}] } }
      end
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to root_url, :notice => "Thank you for signing up! You are now logged in." }
        format.json do
          render :json => {
            :success => true,
            :current_users => [{:username => @user.username, :active => true}]
          }
        end
      else
        format.html { render :action => 'new' }
        format.json { render :json => { :success => false, :message => "Your request was declined", :errors => @user.errors } }
      end
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to root_url, :notice => "Your profile has been updated."
    else
      render :action => 'edit'
    end
  end
end

class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  
  def new
    if APP_CONFIG[:allow_user_registration]
      @user = User.new
    else
      redirect_to root_url
    end
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      if APP_CONFIG[:verify_new_accounts]
        flash[:notice] = "Thanks for signing up! Please check your email for further instructions on how to complete your registration"
        @user.deliver_verification_instructions!
      else
        flash[:notice] = "Thanks for signing up!"
      end
      redirect_to root_url
    else
      render :action => :new
    end
  end
  
  def show
    @user = @current_user
  end

  def edit
    @user = @current_user
  end
  
  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to account_url
    else
      render :action => :edit
    end
  end
end

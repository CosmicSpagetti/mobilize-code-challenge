class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:welcome] = "You are now logged in, #{@user.name}"
      redirect_to root_path
    else
      flash[:error] = "Incorrect Username/Password Combination"
      render :new
    end
  end

  def login
  end

  def welcome
  end
  
  def logout
    reset_session
    flash[:message] = "You are logged out!"
    redirect_to root_path
  end
end

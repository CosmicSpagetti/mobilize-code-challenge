class SessionsController < ApplicationController
  def new
  end

  def create
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

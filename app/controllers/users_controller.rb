class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
   @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:welcome] = "You are now logged in, #{@user.name}"
      redirect_to root_path
    else
      flash[:error] = @user.errors.full_messages.join(". ")
      render :new
    end
  end

  private 

  def user_params
    params.require(:user).permit(:name, :phone_number, :password, :password_confirmation)
  end
end

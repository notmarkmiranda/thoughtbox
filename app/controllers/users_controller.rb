class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Yay!"
      session[:user_id] = @user.id
      redirect_to links_path
    else
      flash.now[:warning] = "Something went wrong! =("
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end

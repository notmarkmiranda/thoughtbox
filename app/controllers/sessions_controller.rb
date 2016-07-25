class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      flash[:success] = "Boom! Logged in!"
      session[:user_id] = @user.id
      redirect_to links_path
    else
      flash[:warning] = "Something went wrong?"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end

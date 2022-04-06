class SessionsController < ApplicationController

  def create
    @user = User.find_by(email: params[:email])
    if !!@user && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect_to root_path
    else
      message = "The email and/or password are incorrect, please check your credentials."
      redirect_to login_path, notice: message
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to login_path
  end
end
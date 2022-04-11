class SessionsController < ApplicationController

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Logged in succesfully"
    else
      redirect_to login_path, notice: "The email and/or password are incorrect, please check your credentials."
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to login_path
  end
end
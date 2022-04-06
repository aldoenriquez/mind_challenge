module ApplicationHelper

  def log_in!
     if !session[:user_id]
       redirect_to login_path
     end
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if !!session[:user_id]
  end

  def logged_in?
    !!session[:user_id]
  end

  def is_admin?
   if !current_user.admin
     redirect_to user_path(current_user.id)
   end
 end
end

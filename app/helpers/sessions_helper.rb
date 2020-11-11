module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def login_user
    return User.find(session[:user_id]) unless session[:user_id].nil? 
  end
end

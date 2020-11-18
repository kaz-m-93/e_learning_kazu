module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def login_user
    return User.find_by(id: session[:user_id]) unless session[:user_id].nil?
  end

  def login_user?
    return session[:user_id] == params[:id].to_i
  end

  def admin_user?(user)
    return user.is_admin
  end
end

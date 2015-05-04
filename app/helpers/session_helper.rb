module SessionHelper
  def current_user
    User.find_by(user_id: session[:user_id])
  end
end

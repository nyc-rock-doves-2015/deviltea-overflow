class SessionsController < ApplicationController

  def new
  end

  def create
    # user = User.find_by(session_params)
    # if user && user.authenticate(params[:password])
    #   session[:user_id] = user.id
    #   redirect_to root_path
    # else
    #   redirect_to login_path
    # end
  end

  def destroy
    #set session id to nil
    #redirect to homepage
  end

  def session_params
    params.require(:session).permit(:name, :password)
  end
end
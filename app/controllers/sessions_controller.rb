class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(name: session_params[:name])
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash.now[:error] = "Your login information was incorrect"
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  def session_params
    params.require(:session).permit(:name, :password)
  end
end
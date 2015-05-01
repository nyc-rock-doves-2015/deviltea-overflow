class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(name: session_params[:name])
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      # hardcoding '/' for now so that I don't have to go into config/routes.rb before getting approval from team
      redirect_to '/'
    else
      flash.now[:error] = "Your login information was incorrect"
      # hard-coded for now! Will replace with rails helper
      redirect_to '/session/new'
    end
  end

  def destroy
    # set session id to nil
    #redirect to homepage
  end

  def session_params
    params.require(:session).permit(:name, :password)
  end
end
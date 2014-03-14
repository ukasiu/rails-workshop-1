class SessionsController < ApplicationController
  def new
  end

  def create
    # params[:email], params[:password]
    user = User.find_by(email: params[:email]).try('authenticate', params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_path, :notice => "You've successfully logged in!"
    else
      flash.now.alert = "Bad credentials"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "You've been logged out!"
  end
end

# Flash messages
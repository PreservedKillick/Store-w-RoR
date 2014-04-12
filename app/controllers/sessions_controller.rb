class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in!"
      if user.role == "owner"
        redirect_to users_path
      else
        redirect_to products_path
      end
    else
      flash.now.alert = "Email or password is invalid."
    end
  end

  def destroy
    user = current_user
    session[:user_id] = nil
    flash[:notice] = "Logged out!"
    redirect_to root_url
  end

end

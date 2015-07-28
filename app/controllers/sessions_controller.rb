class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.username}!"
      redirect_to user_path
    else
      render :new
    end
  end

  def new
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end

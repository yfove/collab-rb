class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      # redirect_to new_session_path, notice: "Logged in!"
      redirect_to projects_path
      flash[:notice] = "You're logged in, #{current_user.name}!"
    else
      flash[:notice] = "The username and/or password is incorrect"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path, notice: "Logged out!"
  end
end

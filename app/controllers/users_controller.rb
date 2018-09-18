class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new

    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    @user.first_name = params[:user][:first_name]
    @user.last_name = params[:user][:last_name]
    @user.email = params[:user][:email]
    @user.bio = params[:user][:bio]
    @user.age = params[:user][:age]
    @user.year = params[:user][:year]
    @user.institution = params[:user][:institution]
    @user.job_field = params[:user][:job_field]
    @user.interests = params[:user][:interests]


    if @user.save
      flash.now[:alert] = ["You have successfully created an account"]
      session[:user_id] = @user.id
      redirect_to '/sessions/new'

    else
      flash.now[:alert] = ["Failed to create an account"]
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
  end

end

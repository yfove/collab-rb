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
      redirect_to projects_url(@user.id)

    else
      flash.now[:alert] = ["Failed to create an account"]
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @owner = @user.members.where(approved: true, owner: true)
    @joined = @user.members.where(approved: true, owner: false)
    @applied = @user.members.where(approved: false, owner: false)
    @projects_owned = []
    @projects_joined = []
    @projects_applied = []

    @applied.each do |apply|
      @projects_applied.push(apply.project_id)
    end

    @joined.each do |join|
      @projects_joined.push(join.project_id)
    end

    @owner.each do |owned|
      @projects_owned.push(owned.project_id)
    end

  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
  end

end

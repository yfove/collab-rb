class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new
    @project.name = params[:project][:name]
    @project.category = params[:project][:category]
    @project.user_id = current_user.id

    if @project.save
      redirect_to projects_url
    else
      flash[:alert] = "Invalid project information"
      render :new
    end
   end

end

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
    @member = Member.new
    @member.user_id = current_user.id
    @member.approved = true
    @member.owner = true
    @member.project_id = @project.id


    if @project.save && @member.save
      redirect_to projects_url
    else
      flash[:alert] = "Invalid project information"
      render :new
    end
   end

end

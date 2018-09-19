class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @owner = User.find(@project.members.where(owner: true)[0].user_id)
    @categories = @project.category
  end

  def new
    @project = Project.new
    @categories = ["biology", "chemistry"]
  end

  def create
    @project = Project.new
    @project.name = params[:project][:name]
    @project.description = params[:project][:description]
    @project.category = params[:project][:category]
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

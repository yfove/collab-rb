class ProjectsController < ApplicationController
  before_action :ensure_logged_in, except: [:show, :index]
  before_action :ensure_user_owns_project, only: [:edit]

  def index
    @projects = Project.all
  end

  def show
    load_project
    @owner = User.find(@project.members.where(owner: true)[0].user_id)
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

   private

   def ensure_user_owns_project
     unless current_user == @project.user
       flash[:alert] = "Access Denied. Please Log In"
       redirect_to new_sessions_url
     end
   end

   def load_project
     @project = Project.find(params[:id])
   end

end

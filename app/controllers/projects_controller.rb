class ProjectsController < ApplicationController
  before_action :ensure_logged_in, except: [:show, :index]
  before_action :ensure_user_owns_project, only: [:edit]

  def index
    @projects = Project.all
  end

  def show
    load_project
    @owner = User.find(@project.members.where(owner: true)[0].user_id)

    if @project.messages.empty? == false
      @visitor_msgs = @project.messages.where(private: false)
      @private_msgs = @project.messages.where(private: true)
    end


  end

  def new
    @project = Project.new
  end

  def edit
    load_project
  end

  def update
    load_project
    @project.name = params[:project][:name]
    @project.description = params[:project][:description]

    if @project.save
      redirect_to project_url(@project)
    else
      flash[:notice] = "Invalid project information"
      render :edit
    end
  end

  def create
    @project = Project.new
    @project.name = params[:project][:name]
    @project.description = params[:project][:description]
    @member = Member.new
    @member.user_id = current_user.id
    @member.approved = true
    @member.owner = true
    @member.project_id = @project.id


    if @project.save
      @member = Member.new
      @member.user_id = current_user.id
      @member.approved = true
      @member.owner = true
      @member.project_id = @project.id
      @member.save
      redirect_to projects_url
    else
      flash[:notice] = "Invalid project information"
      render :new
    end
   end

   def destroy
     load_project
     @project.destroy
     redirect_to projects_url
   end

   private

   def ensure_user_owns_project
     load_project
     unless current_user == @project.members.where(owner: true).first.user_id
       flash[:alert] = "Access Denied. Please Log In"

     end
   end

   def load_project
     @project = Project.find(params[:id])
   end

end

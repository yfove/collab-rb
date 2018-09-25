class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def show
    load_project ##this returns @project
    @owner = User.find(@project.members.where(owner: true).first.user_id)
    @message = Message.new
    @collaborators = @project.members.where(approved: true)
    @categories = @project.categories

    if @project.messages.empty? == false
      @visitor_msgs = @project.messages.where(private: false)
      @private_msgs = @project.messages.where(private: true)
    end
  end

  def new
    @project = Project.new
    @categories = Category.all
  end

  def edit
    load_project
  end

  def update
    load_project
    @project.name = params[:project][:name]
    @project.description = params[:project][:description]
    @categories = params[:project][:categories]
    Categorization.all.where(project_id: @project.id).destroy_all
    @project.looking_for = params[:project][:looking_for].split(',')


    if @categories != nil
      @categories.each do |category|
        categorization = Categorization.new
        categorization.project = @project
        categorization.category_id = category
        categorization.save
      end
    end

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
    @project.looking_for = params[:project][:looking_for].split(',')
    @categories = params[:project][:categories]

    @member = Member.new
    @member.user = current_user
    @member.approved = true
    @member.owner = true
    @member.project = @project

    if @categories != nil
      @categories.each do |category|
        categorization = Categorization.new
        categorization.project = @project
        categorization.category_id = category
        categorization.save
      end
    end

    if @project.save && @member.save
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

  def applicants
    @project = Project.find(params[:project_id])
    @applicants = Member.all.where(project_id: @project.id)
  end

  def new_applicant

  end

  def create_applicant
    @project = Project.find(params[:project_id])
    @member = Member.new
    @member.project = @project
    @member.approved = false
    @member.owner = false
    @member.user = current_user
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

class MessagesController < ApplicationController
  before_action :ensure_logged_in

  def create
    @project = Project.find(params[:project_id])
    @message = Message.new
    @message.content = params[:message][:content]
    @message.private = params[:message][:private]
    @message.project_id = params[:project_id]
    @message.user_id = current_user.id

    if @message.save
      flash.now[:notice] = "Your message has been posted."
      redirect_to project_url(@project)
    else
      flash.now[:notice] = "There was an error with your message. Please try again."
      render 'projects/show'
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    redirect_to project_url(params[:project_id]), notice: 'Message deleted'
  end
end

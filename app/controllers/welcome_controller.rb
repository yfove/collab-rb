class WelcomeController < ApplicationController
  def index
    @projects_count = Project.all.count
    @users_count = User.all.count

  end
end

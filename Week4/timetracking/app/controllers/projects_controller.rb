class ProjectsController < ApplicationController
  def index
    @projects = Project.order(created_at: :desc).limit(10)
  end


  def show
    @my_project = Project.find_by(id: params[:id])

    unless @my_project
      render "no_projects_found"
    end
  end
end

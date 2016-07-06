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

  def new
    @my_project = Project.new
  end

  def create
    @my_project = Project.new(name: params[:project][:name],
                              description: params[:project][:description])
    @my_project.save
    redirect_to "/projects/#{@my_project.id}"
  end
end

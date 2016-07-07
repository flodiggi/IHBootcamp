class TimeEntriesController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @time_entries = @project.time_entries.where("date > ?", 1.month.ago)

  end


  def new
    @my_project = Project.find(params[:project_id])
    @my_entry = @my_project.time_entries.new

  end

  def create
    @my_project = Project.find(params[:project_id])
    @my_entry = @my_project.time_entries.create(
    hours: params[:time_entry][:hours],
    minutes: params[:time_entry][:minutes],
    date: params[:time_entry][:date]
    )

    if @my_entry
      redirect_to action: "index", controller: "time_entries", project_id: @my_project.id
    else
      render "new"
    end
  end

end

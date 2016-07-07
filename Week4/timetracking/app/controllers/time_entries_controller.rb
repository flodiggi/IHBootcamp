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

def edit

  @my_project = Project.find(params[:project_id])
  @my_entry = @my_project.time_entries.find(params[:id])

end

def update
  @my_project = Project.find(params[:project_id])
  @my_entry = @my_project.time_entries.find(params[:id])
  if @my_entry.update(hours: params[:time_entry][:hours],
                      minutes: params[:time_entry][:minutes],
                      date: params[:time_entry][:date],
                      comments: params[:time_entry][:comments])
                      flash[:notice] = "Time entry successfully updated"

  redirect_to action: "index", controller: "time_entries", project_id: @my_project.id
  else
  render "edit"
  end

end

def delete

  @my_project = Project.find(params[:project_id])
  @my_entry = @my_project.time_entries.find(params[:id])

  @my_entry.destroy

end



private
def entry_params
  params.require(:time_entry).permit(:hours, :minutes, :date)

end



end


require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'YAML/Store'

enable :sessions
require_relative('./lib/TodoList.rb')



todo_list = TodoList.new("Flo")
todo_list.addtask Task.new("Walk the dog")
todo_list.addtask Task.new("Buy the milk")
todo_list.addtask Task.new("Make my todo list into a web app")
todo_list.save



get '/' do
  @user = todo_list.user
  erb :home
end



get '/task' do

  @todo = []
  @done = []
  @tasks = todo_list.tasks
  @tasks.each do |task|
    if task.status == false
      @todo.push(task)
    else task.status == true
      @done.push(task)
    end
  end

  erb :task_index
end

post '/complete_task' do
  ids = params[:id]
  tochange = []
  ids.each do |task|
  change = todo_list.find_task_by_id(task.to_i)
  change.change_status!
  end
redirect to '/task'
end

post '/delete_task' do
  ids = params[:id]
  todelete = []
  ids.each do |id|
  todo_list.deletetask(id.to_i)
  end
  todo_list.save

redirect to '/task'
end






get '/new_task' do
    erb :new_task
  end

post '/create_task' do

  task = params[:task]
  todo_list.addtask Task.new(task)
  todo_list.save
  redirect to '/task'
end

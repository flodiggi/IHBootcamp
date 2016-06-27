require 'pry'
require 'YAML/Store'
class Task
    attr_accessor :content, :id, :created_at, :status, :updated_at
    def initialize(content)
        @content = content
        @id = 0
        @status = false
        @created_at = Time.now
        @updated_at = nil
    end

    def complete?
      if @status == false
      return "Incomplete"
      elsif @status == true
      return "Completed"
      end
    end


    def change_status!
      if @status == false
        @status = true
      elsif @status == true
        @status = false
      end
    end

    def update_content!(newcontent)
      @updated_at = Time.now
      @content = newcontent
    end
end

class TodoList
    attr_reader :tasks, :user, :todo_store
    def initialize(user)
        @@todo_store = YAML::Store.new("tasks.yml")
        @tasks = []
        @user = user
        @loaded ={}
        @counter = 0

    end

    def addtask(task)
      @counter += 1
      task.id = @counter
      @tasks.push(task)
      @tasks
    end

    def display
       @tasks
    end

    def deletetask(id)
      @tasks.delete_if {|task| task.id == id}
    end

    def find_task_by_id(task_id)
      @tasks.find { |e| e.id ==  task_id }

    end

    def sort_by_created
      @tasks.sort {|x,y| x.created_at <=> y.created_at}
    end

    def save
      @@todo_store.transaction do
        @@todo_store[@user] = @tasks
      end
    end

    def load_tasks
      @loaded = YAML.load_file("tasks.yml")
      @tasks = @loaded
      return @tasks
    end




end

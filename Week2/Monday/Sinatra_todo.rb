require 'pry'
require 'YAML/Store'
class Task
    attr_reader :content, :id, :created_at
    @@current_id = 1
    def initialize(content)
        @content = content
        @id = @@current_id
        @@current_id += 1
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
        @todo_store = YAML::Store.new("./public/tasks.yml")
        @tasks = []
        @user = user

    end

    def addtask(task)
      @tasks.push(task)
      @tasks
    end

    def display
       @tasks
    end

    def deletetask(id)
      @tasks.delete_if {|task| task.id == id}
    end

    def find_task_by_id(id)
      @tasks.each do |task|
        if task.id == id
          return task
        else
          return nil
        end
      end
    end

    def sort_by_created
      @tasks.sort {|x,y| x.created_at <=> y.created_at}
    end

    def save
      @todo_store.transaction do
        @todo_store[@user] = @tasks
      end
    end


end

todo_list = TodoList.new("Josh")
todo_list.addtask Task.new("Walk the dog")
todo_list.addtask Task.new("Buy the milk")
todo_list.addtask Task.new("Make my todo list into a web app")
todo_list.save

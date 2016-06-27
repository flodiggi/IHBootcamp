require 'rspec'
require './Sinatra_todo'

describe Task do
  subject {described_class.new("Writing some code")}

#   before do
#     task1 = Task.new("code some stuff")
#     subject.addtask(task1)
# end


  describe "#complete?" do
    let(:expected_output) {"Incomplete"}
    let(:result) { subject.complete?}

    it "shows whether task is completed" do
      expect(result).to eq(expected_output)
    end
  end


  describe "#change_status!" do
    let (:expected_output) {true}
    let (:result) {subject.change_status!}

    it "changes the current status of taks to complete" do
      expect(result).to eq(expected_output)
    end
  end


  describe "#update_content!" do
    let (:input) {"Write some more code"}
    let (:expected_output) {"Write some more code"}
    let (:result) {subject.update_content!(input)}

    it "changes the current status of taks" do
      expect(result).to eq(expected_output)
    end
  end

end

  describe TodoList do
    subject {described_class.new("Flo")}

  describe "#addtask" do

    let(:task) { Task.new("new task 2")}
    let(:input) {task}
    let(:expected_output) {1}
    let(:result) { subject.addtask(input)}

    it "adds task" do
      expect(result.length).to eq(expected_output)
    end
  end

  describe "#display" do
  let(:expected_output) {subject.tasks}
  let(:result) {subject.display}

    it "shows me my tasks" do
      expect(result).to eq(expected_output)
    end
  end

  describe "#deletetask" do
    let(:input) {1}
    let(:expected_output) {0}
    let(:result) { subject.deletetask(input)}

    it "shows whether task is deleted" do
      expect(result.length).to eq(expected_output)
    end
  end

  describe "#find_task_by_id" do
  # let (:newtask) {Task.new("new task 3")  }
  # let(:input) {5}
  # let(:expected_output) {newtask}
  # let(:listnew) { subject.addtask(newtask)}
  # let(:result) { subject.find_task_by_id(input)}

  it "displays selected task" do
    task = Task.new("new task 5")
    subject.addtask(task)
    result = subject.find_task_by_id(8)
    expect(result).to eq(task)
  end
end

describe "#sort_by_created" do


  it "shows sorted task" do
    task1 = Task.new("new task 6")
    task2 = Task.new("new task 7")
    subject.addtask(task1)
    subject.addtask(task2)
    result = subject.sort_by_created
    expect(result).to eq([task1,task2])
    end
end



end

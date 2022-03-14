require 'task_list_v1'

RSpec.describe TaskList do
  context "initially" do
    it "contains en empty list" do
      list = TaskList.new

      expect(list.tasks).to eq []
    end
  end

  it "adds a todo to the todo list" do
    list = TaskList.new
    list.add_task("Wash dog")

    expect(list.tasks).to eq ["Wash dog"]
  end 


  it "adds more than one item to todo list" do
    list = TaskList.new
    list.add_task("Wash dog")
    list.add_task("Buy milk")
    
    expect(list.tasks).to eq ["Wash dog", "Buy milk"]
  end

  it "sees the todo list" do
    list = TaskList.new
    list.add_task("Wash dog")
    list.add_task("Buy milk")

    expect(list.see_list).to eq "- Wash dog\n- Buy milk\n"
  end

  it "removes a task when complete" do
    list = TaskList.new
    list.add_task("Wash dog")
    list.add_task("Buy milk")
    list.complete("Wash dog")

    expect(list.see_list).to eq "- Buy milk\n"
  end
  
  it "shows all tasks completed" do
    list = TaskList.new
    list.add_task("Wash dog")
    list.complete("Wash dog")

    expect(list.see_list).to eq "You have completed all your todos today!"
  end
end
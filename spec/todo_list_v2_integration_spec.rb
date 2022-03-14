require 'todo_v2'
require 'todo_list_v2'

RSpec.describe "integration" do
  context "given a task" do
    it "adds a task to the incomplete todo list" do
      todo_list = TodoList.new
      task = Todo.new("wash dog")
      todo_list.add(task)
      
      expect(todo_list.incomplete).to eq [task]
    end
  end

  context "given multiple tasks" do
    it "adds multiple tasks to the incomplete todo list" do
      todo_list = TodoList.new
      task_1 = Todo.new("wash dog")
      task_2 = Todo.new("iron clothes")
      todo_list.add(task_1)
      todo_list.add(task_2)

      expect(todo_list.incomplete).to eq [task_1, task_2]
    end
  end

  context "give up all tasks" do
    it "moves all tasks to completed" do
      todo_list = TodoList.new
      task_1 = Todo.new("wash dog")
      task_2 = Todo.new("iron clothes")
      todo_list.add(task_1)
      todo_list.add(task_2)

      expect(todo_list.give_up!).to eq [task_1, task_2]
      expect(todo_list.incomplete).to eq []
    end
  end

  context "mark task as done" do
    it "task will move from incomplete to completed" do
      todo_list = TodoList.new
      task_1 = Todo.new("wash dog")
      task_2 = Todo.new("iron clothes")
      todo_list.add(task_1)
      todo_list.add(task_2)
      task_1.mark_done!

      expect(todo_list.complete).to eq [task_1]
      expect(todo_list.incomplete).to eq [task_2]
    end
  end
end 
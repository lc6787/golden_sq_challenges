require 'todo_list'

RSpec.describe TodoList do

  it "intially contains en empty list" do
  list = TodoList.new
  expect(list.todos).to eq []
  end

  it "adds a todo to the todo list" do
  list = TodoList.new
  list.add_todo("Wash dog")
  expect(list.todos).to eq ["Wash dog"]
  end

  it "adds more than one item to todo list" do
    list = TodoList.new
    list.add_todo("Wash dog")
    list.add_todo("Buy milk")
    expect(list.todos).to eq ["Wash dog", "Buy milk"]
  end

  it "sees the todo list" do
    list = TodoList.new
    list.add_todo("Wash dog")
    list.add_todo("Buy milk")
    expect(list.see_list).to eq "- Wash dog\n- Buy milk\n"
  end

  it "removes a task when complete" do
    list = TodoList.new
    list.add_todo("Wash dog")
    list.add_todo("Buy milk")
    list.complete("Wash dog")
    expect(list.see_list).to eq "- Buy milk\n"
  end
  
  it "shows all tasks completed" do
    list = TodoList.new
    list.add_todo("Wash dog")
    list.complete("Wash dog")
    expect(list.see_list).to eq "You have completed all your todos today!"
  end
end
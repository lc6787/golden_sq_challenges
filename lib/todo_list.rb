# As a user
# So that I can keep track of my tasks
# I want a program that I can add todo tasks to and see a list of them.

# As a user
# So that I can focus on tasks to complete
# I want to mark tasks as complete and have them disappear from the list.

class TodoList
  def initialize
    @todo_list = []
  end

  def todos
    return @todo_list
  end

  def add_todo(todo)
    @todo_list << todo
  end

  def see_list
    if @todo_list.length >= 1
      list = ""
      for task in @todo_list do
      list << "- #{task}\n"
      end
      return list
    else
      return "You have completed all your todos today!"
    end
  end

  def complete(todo)
   @todo_list.delete(todo)
  end
end
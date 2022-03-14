# As a user
# So that I can keep track of my tasks
# I want a program that I can add todo tasks to and see a list of them.

# As a user
# So that I can focus on tasks to complete
# I want to mark tasks as complete and have them disappear from the list.

class TaskList
  def initialize
    @task_list = []
  end

  def tasks
    return @task_list
  end

  def add_task(task)
    @task_list << task
  end

  def see_list
    if @task_list.length >= 1
      list = ""
      for task in @task_list do
      list << "- #{task}\n"
      end
      return list
    else
      return "You have completed all your todos today!"
    end
  end

  def complete(task)
   @task_list.delete(task)
  end
end
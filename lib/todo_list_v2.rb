class TodoList
  def initialize
    @incomplete_todo_list = []
    @complete_todo_list = []
  end

  def add(todo)
    @incomplete_todo_list << todo
  end

  def incomplete
    sort_list
    return @incomplete_todo_list
  end

  def complete
    sort_list
    return @complete_todo_list
  end

  def give_up!
    @complete_todo_list.concat(@incomplete_todo_list)
    @incomplete_todo_list.clear
    return @complete_todo_list
  end

  def sort_list
    @incomplete_todo_list.each do |task| 
      if task.done?
        @complete_todo_list << task
        @incomplete_todo_list.delete(task)
      else
        return @incomplete_todo_list
      end
    end
  end
end
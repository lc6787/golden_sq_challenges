class Todo
  def initialize(todo)
    @todo = todo
    @done = false
  end

  def todo
    return @todo
  end

  def mark_done!
    @done = true
  end

  def done?
    return @done
  end
end
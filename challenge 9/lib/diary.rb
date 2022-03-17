class Diary
  def initialize
    @my_diary = {}
  end

  def add(entry)
      @my_diary[entry.date] = entry.reflection
  end

  def list_entries
    return @my_diary
  end

  def list_dates
    return @my_diary.keys
  end

  def reflection(date)
    return @my_diary[date] 
  end

  def word_count(date)
    return @my_diary[date].split(" ").length
    # return the number of words in the value of the given key value pair
  end
end
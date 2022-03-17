class DiaryReader
  def initialize(wpm, my_diary)
    @my_diary = my_diary
    @wpm = wpm
  end

  def read(date)
    return @my_diary.reflection(date)
  end
  
  def count_words(date)
    fail "No entry found!" unless @my_diary.list_dates.include?(date)
    return @my_diary.word_count(date)
  end

  def reading_time(date)
      return (count_words(date) / @wpm.to_f).ceil
  end
  
  def select_entry_on_time(minutes)
    diary_entries = @my_diary.list_entries # creates hash variable
    read_time = {}
    diary_entries.each do | date, reflection | # takes each key-value pair
      read_time[date] = reading_time(date) # returns reading time for each pair
    end
    read_time.reject! { | date, time | time > minutes }
    selection = read_time.max_by { | date, time | time }
    return selection.first
     # take the time and find the closest to the minutes
  end


  # As a user
    # So that I can reflect on my experiences in my busy day
    # I want to select diary entries to read based on how much time I have and my reading speed

end
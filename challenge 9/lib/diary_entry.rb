class DiaryEntry
  def initialize(date, entry)
    @date = date
    @entry = entry
    @word_count = 0
  end

  def date
    return @date
  end

  def reflection
   return @entry
  end

  def word_counter
    @word_count = @entry.split(" ").length
  end
end
class DiaryEntry
    def initialize(title, contents) 
      @title = title
      @contents = contents
      @last_word_read = 0
    end
  
    def title
      return @title
    end
  
    def contents
      return @contents  
    end
  
    def count_words
      return words.length
    end
  
    def reading_time(wpm)
      fail "Reading speed must be above zero." unless wpm.positive?
      return count_words / wpm.to_f
    end
  
    def reading_chunk(wpm, minutes)
      words_in_given_time = wpm * minutes
      start_from = @last_word_read
      end_at = @last_word_read + words_in_given_time

      chunk = words[start_from, 2]

      if end_at > count_words
        @last_word_read = 0
        return chunk.join(" ")
      else
        @last_word_read = end_at
        return chunk.join(" ")
      end

    

      # Returns a string with a chunk of the contents that the user could read
      # in the given number of minutes.
      # If called again, `reading_chunk` should return the next chunk, skipping
      # what has already been read, until the contents is fully read.
      # The next call after that it should restart from the beginning.
    end

    private

    def words
      @contents.split(" ")
    end
  end
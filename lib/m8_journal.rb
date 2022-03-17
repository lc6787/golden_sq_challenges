class Journal
    def initialize
      @my_journal = []
      total_word_count = 0
    end
  
    def add(entry)
      @my_journal << entry
    end
  
    def all
      return @my_journal
    end
  
    def count_words
      @my_journal.map do | entry |
        entry.count_words
      end.sum
    end
  
    def reading_time(wpm) 
      fail "Reading speed must be above zero." unless wpm.positive?
      return count_words / wpm.to_f
    end
  
    def find_best_entry_for_reading_time(wpm, minutes)
          # `wpm` is an integer representing the number of words the user can read
          # per minute.
          # `minutes` is an integer representing the number of minutes the user
          # has to read.
      # Returns an instance of diary entry representing the entry that is closest 
      # to, but not over, the length that the user could read in the minutes they
      # have available given their reading speed.
    end
  end
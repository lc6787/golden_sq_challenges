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
      for entry in @my_journal do
        word_count = entry(@contents).word_count
        total_word_count += word_count
      end
    end
  
    def reading_time(wpm) # wpm is an integer representing
                          # the number of words the user can read per minute
      # Returns an integer representing an estimate of the reading time in minutes
      # if the user were to read all entries in the diary.
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
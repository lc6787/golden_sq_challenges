# As a user
# So that I can keep track of my music listening
# I want to add tracks I've listened to and see a list of them.

class MusicTracker
  def initialize
    @tracks_listened_to = 0
    @history = {}
  end

  def no_tracks_listened_to
    return @tracks_listened_to
  end

  def add_music(artist, track)
   @tracks_listened_to += 1
   @history[artist] = track
  end
  
  def history
    history = @history.map { |artist, track| "#{artist} - #{track}"}.to_a
    puts "YOUR HISTORY:\n#{history.join("\n")}"
    return "YOUR HISTORY:\n#{history.join("\n")}"
  end
end
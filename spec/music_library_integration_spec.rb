require 'music_library'
require 'track'

RSpec.describe "integration" do
  context "adds tracks to music library" do
    it "comes back in a list" do
      music_library = MusicLibrary.new
      track_1 = Track.new("Jaded", "Aerosmith")
      track_2 = Track.new("Call Me", "Blondie")
      music_library.add(track_1)
      music_library.add(track_2)

      expect(music_library.all).to eq [track_1, track_2]
    end
  end

  context "with some tracks added" do
    it "searches those tracks by full title" do
      music_library = MusicLibrary.new
      track_2 = Track.new("Call Me", "Blondie")
      track_1 = Track.new("Jaded", "Aerosmith")
      music_library.add(track_1)
      music_library.add(track_2)
      result = music_library.search_by_title("Call Me")
    
      expect(result).to eq [track_2]
    end
  end

  it "searches those tracks by partial title" do
    music_library = MusicLibrary.new
    track_1 = Track.new("Call Me", "Blondie")
    music_library.add(track_1)
    result = music_library.search_by_title("Call")
    
    expect(result).to eq [track_1]
  end

  context "when no results found when searching by title" do
    it "returns an empty list" do
      music_library = MusicLibrary.new
      track_1 = Track.new("Call Me", "Blondie")
      music_library.add(track_1)
      result = music_library.search_by_title("Jaded")
      
      expect(result).to eq []
    end
  end
end
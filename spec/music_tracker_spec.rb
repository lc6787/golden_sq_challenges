require 'music_tracker'

RSpec.describe MusicTracker do

  it "has a music account" do
    account = MusicTracker.new

    expect(account.no_tracks_listened_to).to eq 0
  end

  it "adds a track to my track count" do
    account = MusicTracker.new
    account.add_music("Aerosmith", "Jaded")

    expect(account.no_tracks_listened_to).to eq 1
  end

  it "adds multiple tracks to track count" do
    account = MusicTracker.new
    account.add_music("Aerosmith", "Jaded")
    account.add_music("Blondie", "Call Me")

    expect(account.no_tracks_listened_to).to eq 2
  end

  it "show track history" do
    account = MusicTracker.new
    account.add_music("Aerosmith", "Jaded")
    account.add_music("Blondie", "Call Me")

    expect(account.history).to eq "YOUR HISTORY:\nAerosmith - Jaded\nBlondie - Call Me"
  end
end
require 'track'

RSpec.describe Track do
  it "contructs" do
  track_1 = Track.new("Call Me", "Blondie")

  expect(track_1.title).to eq ("Call Me")
  expect(track_1.artist).to eq ("Blondie")
  end

  it "formats to string" do
    track_1 = Track.new("Call Me", "Blondie")

    expect(track_1.format).to eq ("CALL ME by BLONDIE")
  end
end
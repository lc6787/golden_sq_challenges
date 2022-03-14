require 'music_library'

RSpec.describe MusicLibrary do
  context "initially" do
    it "creates a library" do
    my_library = MusicLibrary.new
    
    expect(my_library.all).to eq []
    end
  end
end
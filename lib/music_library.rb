class MusicLibrary
  def initialize
    @my_library = []
  end
  
  def add(track) 
    @my_library << track
  end
  
  def all
    return @my_library
  end
    
  def search_by_title(keyword)
    @my_library.select do |track| 
    track.title.include?(keyword)
    end
  end
end 


def make_snippet(diary_entry)
  words = diary_entry.split(" ")
  if words.count >= 5
    return "#{words.first(5).join(" ")}..."
  else
    return diary_entry
  end 
end

def count_words(string)
  return string.split(" ").length
end
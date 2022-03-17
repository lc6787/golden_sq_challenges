class Contacts
  def initialize(diary)
    @my_diary = diary
    @list = []
  end


  def extract_numbers
    @my_diary.list_entries.each do | date, reflection |
      found_number = scan_entries(date)
      if found_number 
        @list << found_number
      end
    end
    if @list.flatten == []
      return "No contacts found." 
    else
      clean_list
      return list
    end
  end

  def clean_list
    return @list.uniq!
  end

  def list
    return @list.flatten
  end

  def scan_entries(date)
    @my_diary.reflection(date).scan(/07[0-9]{9}/)
  end
end
require 'diary_entry'

RSpec.describe DiaryEntry do
  it "contsructs" do
    entry_1 = DiaryEntry.new("date", "todays reflections")

    expect(entry_1.date).to eq "date"
    expect(entry_1.reflection).to eq "todays reflections"
  end

  context "counts words" do
    it "counts words in the entry" do
    entry_1 = DiaryEntry.new("date", "todays reflections")
    
    expect(entry_1.word_counter).to eq 2
    end
    
    it "returns zero when entry is empty" do
      entry_1 = DiaryEntry.new("date", "")  
      
      expect(entry_1.word_counter).to eq 0
    end
  end
end
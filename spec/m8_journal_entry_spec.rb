require 'm8_journal_entry'

RSpec.describe "journal entries" do
  context "when adding a journal entry" do
    it "returns title or contents" do
        entry_1 = JournalEntry.new("Monday", "Today was a great day. I learnt test driven development!")

        expect(entry_1.title).to eq "Monday"
        expect(entry_1.contents).to eq "Today was a great day. I learnt test driven development!"
    end
  end
  
  context "when counting words in contents" do
    it "counts words in one entry" do
      entry_1 = JournalEntry.new("Monday", "Today was a great day. I learnt test driven development!")

      expect(entry_1.count_words).to eq 10
    end

    it "returns zero when no contents" do
      entry_1 = JournalEntry.new("Monday", "")

      expect(entry_1.count_words).to eq 0
    end
  end

  context "when estimating reading time" do
    it "estimates the reading time of contents based on given wpm" do
      entry_1 = JournalEntry.new("Monday", "Today was a great day. I learnt test driven development!")
      result = entry_1.reading_time(5)

      expect(result).to eq 2
    end

    it "yields error message when zero given as speed" do
      entry_1 = JournalEntry.new("Monday", "Today was a great day. I learnt test driven development!")

      expect { entry_1.reading_time(0) }.to raise_error "Reading speed must be above zero."
    end

    it "returns zero when empty contents" do
      entry_1 = JournalEntry.new("Monday", "")
      result = entry_1.reading_time(5)

      expect(result).to eq 0
    end
  end

end
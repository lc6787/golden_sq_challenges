require 'm8_journal'
require 'm8_journal_entry'

RSpec.describe "integration" do
  context "when adding journal entries" do
    it "adds entries from journal instances" do
      my_journal = Journal.new
      entry_1 = JournalEntry.new("Monday", "Today was a great day. I learnt test driven development!")
      my_journal.add(entry_1)
      
      expect(my_journal.all).to eq [entry_1]
    end

    it "adds multiple journal entries" do
      my_journal = Journal.new
      entry_1 = JournalEntry.new("Monday", "Today was a great day. I learnt test driven development!")
      entry_2 = JournalEntry.new("Tuesday", "The sun was shinning, I went for a walk.")
      my_journal.add(entry_1)
      my_journal.add(entry_2)
      
      expect(my_journal.all).to eq [entry_1, entry_2]
    end
  end

  context "in all journal entries" do
    it "counts the total words in all the contents" do
      my_journal = Journal.new
      entry_1 = JournalEntry.new("Monday", "Today was a great day. I learnt test driven development!")
      entry_2 = JournalEntry.new("Tuesday", "The sun was shinning, I went for a walk.")
      my_journal.add(entry_1)
      my_journal.add(entry_2)

      expect(my_journal.count_words).to eq 19
    end

    it "calculates estimated reading time" do
      my_journal = Journal.new
      entry_1 = JournalEntry.new("Monday", "Today was a great day. I learnt test driven development!")
      entry_2 = JournalEntry.new("Tuesday", "The sun was shinning, I went for a walk.")
      my_journal.add(entry_1)
      my_journal.add(entry_2)

      expect(my_journal.reading_time(5)).to eq 3.8
    end

    it "yields error message when zero reading speed given" do
      my_journal = Journal.new
      entry_1 = JournalEntry.new("Monday", "Today was a great day. I learnt test driven development!")
      my_journal.add(entry_1)

      expect { my_journal.reading_time(0) }.to raise_error "Reading speed must be above zero."
    end

  end
end
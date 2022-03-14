require 'm8_journal_entry'

RSpec.describe "journal entries" do
  context "when adding a journal entry" do
    it "returns title or contents" do
        entry_1 = JournalEntry.new("Monday", "Today was a great day. I learnt test driven development!")

        expect(entry_1.title).to eq "Monday"
        expect(entry_1.contents).to eq "Today was a great day. I learnt test driven development!"
    end
  end

  it "counts words in one entry contents" do
    entry_1 = JournalEntry.new("Monday", "Today was a great day. I learnt test driven development!")

    expect(entry_1.count_words).to eq 10
  end
end
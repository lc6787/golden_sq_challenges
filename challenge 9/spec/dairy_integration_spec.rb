require 'diary'
require 'diary_entry'
require 'diary_reader'
require 'contacts'


RSpec.describe "integration" do
  context "adding an entry" do
    it "adds one entry to the diary" do
      my_diary = Diary.new
      entry_1 = DiaryEntry.new("date1", "todays reflections")
      result = my_diary.add(entry_1)

      expect(result).to eq "todays reflections"
    end

    it "can add multiple entries to the diary" do
    my_diary = Diary.new
    entry_1 = DiaryEntry.new("date1", "todays reflections")
    entry_2 = DiaryEntry.new("date2", "todays reflections")
    my_diary.add(entry_1)
    my_diary.add(entry_2)
      
    expect(my_diary.list_entries).to eq ({"date1"=>"todays reflections", "date2"=>"todays reflections"})
    expect(my_diary.list_dates).to eq ["date1", "date2"]
    end
  end

  it "returns diary entry to read" do
    my_diary = Diary.new
    entry_1 = DiaryEntry.new("date1", "todays reflections1")
    entry_2 = DiaryEntry.new("date2", "todays reflections2")
    lauren = DiaryReader.new(6, my_diary)
    my_diary.add(entry_1)
    my_diary.add(entry_2)

    expect(lauren.read("date2")).to eq "todays reflections2"
  end

  context "length of an entry reflection" do
    it "returns the number of words in given reflection" do
      my_diary = Diary.new
      entry_1 = DiaryEntry.new("date1", "todays reflections1")
      entry_2 = DiaryEntry.new("date2", "todays reflections2")
      lauren = DiaryReader.new(6, my_diary)
      my_diary.add(entry_1)
      my_diary.add(entry_2)

      expect(lauren.count_words("date1")).to eq 2
    end

    it "returns the number of words in an empty reflection" do
      my_diary = Diary.new
      entry_1 = DiaryEntry.new("date1", "todays reflections1")
      entry_2 = DiaryEntry.new("date2", "")
      lauren = DiaryReader.new(6, my_diary)
      my_diary.add(entry_1)
      my_diary.add(entry_2)

      expect(lauren.count_words("date2")).to eq 0
    end
  end

  context "when there is no matching entry" do
    it "yields an error" do
      my_diary = Diary.new
      entry_1 = DiaryEntry.new("date1", "todays reflections1")
      lauren = DiaryReader.new(6, my_diary)
      my_diary.add(entry_1)

      expect { lauren.count_words("date2") }.to raise_error "No entry found!"
    end
  end

  context "reader wants to know time required to read" do
    it "takes entry and returns reading time in minutes" do
      my_diary = Diary.new
      entry_1 = DiaryEntry.new("date1", "Today's a wonderful day. I am making progress!")
      entry_2 = DiaryEntry.new("date2", "Always celebrate the small wins!")
      lauren = DiaryReader.new(2, my_diary)
      my_diary.add(entry_1)
      my_diary.add(entry_2)

      expect(lauren.reading_time("date1")).to eq 4
      expect(lauren.reading_time("date2")).to eq 3
    end
  end

  context "reader has limited minutes to read" do
    it "selects best entry based on given time and wpm" do
      my_diary = Diary.new
      entry_1 = DiaryEntry.new("date1", "Today's a wonderful day. I am making progress!")
      entry_2 = DiaryEntry.new("date2", "Always celebrate the small wins!")
      lauren = DiaryReader.new(2, my_diary)
      my_diary.add(entry_1)
      my_diary.add(entry_2)

      expect(lauren.select_entry_on_time(4)).to eq ("date1")
    end

    it "selects best entry based on given time and wpm" do
      my_diary = Diary.new
      entry_1 = DiaryEntry.new("date1", "Today's a wonderful day. I am making progress!")
      entry_2 = DiaryEntry.new("date2", "Always celebrate the small wins!")
      lauren = DiaryReader.new(2, my_diary)
      my_diary.add(entry_1)
      my_diary.add(entry_2)

      expect(lauren.select_entry_on_time(3)).to eq ("date2")
    end
  end

  describe Contacts do
    it "constructs" do
      my_diary = Diary.new
      contacts = Contacts.new(my_diary)

      expect(contacts.list).to eq []
    end

    context "diary entries with phone numbers" do
      it "extracts multiple numbers into contact list" do
        my_diary = Diary.new
        entry_1 = DiaryEntry.new("date1", "Today I met Alan. 07123456789.")
        entry_2 = DiaryEntry.new("date2", "Today I met Susan. 07987654321.")
        contacts = Contacts.new(my_diary)
        my_diary.add(entry_1)
        my_diary.add(entry_2)
        
        expect(contacts.extract_numbers).to eq ["07123456789", "07987654321"]
      end

    end

    it "extracts only unique numbers into contact list" do
      my_diary = Diary.new
      entry_1 = DiaryEntry.new("date1", "Today I met Alan. 07123456789.")
      entry_2 = DiaryEntry.new("date2", "Today I met Susan. 07987654321.")
      entry_3 = DiaryEntry.new("date3", "Today I met Sally. 07123456789.")
      contacts = Contacts.new(my_diary)
      my_diary.add(entry_1)
      my_diary.add(entry_2)
      my_diary.add(entry_3)
      
      expect(contacts.extract_numbers).to eq ["07123456789", "07987654321"]
    end

    context "no entries with phone numbers" do
      it "returns no entries message" do
        my_diary = Diary.new
        entry_1 = DiaryEntry.new("date1", "Today's a wonderful day. I am making progress!")
        entry_2 = DiaryEntry.new("date2", "Always celebrate the small wins!")
        contacts = Contacts.new(my_diary)
        my_diary.add(entry_1)
        my_diary.add(entry_2)

        expect(contacts.extract_numbers).to eq "No contacts found."
      end
    end
  end
# As a user
# So that I can keep track of my contacts
# I want to see a list of all of the mobile phone numbers in all my diary entries
end


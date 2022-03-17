require 'contacts'

RSpec.describe Contacts do
  it "constructs" do
    diary = Diary.new
    contacts = Contacts.new(diary)

    expect(contacts.list).to eq []
  end

  it "intitially" do
    diary = Diary.new
    contacts = Contacts.new(diary)

    expect(contacts.extract_numbers).to eq "No contacts found."
  end
end
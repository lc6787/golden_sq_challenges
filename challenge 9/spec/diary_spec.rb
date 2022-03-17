require 'diary'

RSpec.describe Diary do
  context "constructs" do
    it "starts with an empty list" do
      my_diary = Diary.new
      expect(my_diary.list_dates).to eq []
    end
  end
  
end
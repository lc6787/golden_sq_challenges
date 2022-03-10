require 'diary_entry'

RSpec.describe DiaryEntry do

  it "returns title" do
		diary = DiaryEntry.new("Monday's entry", "Today is a good day because I am testing")
		expect(diary.title).to eq "Monday's entry"
	end

	it "returns contents" do
		diary = DiaryEntry.new("Monday's entry", ("Today is a good day because I am testing!" * 150))
	  expect(diary.contents).to eq ("Today is a good day because I am testing!" * 150)
	end

	it "counts words in contents arguement" do
		diary = DiaryEntry.new("Monday's entry", ("Today is a good day because I am testing! " * 150))
	  expect(diary.count_words).to eq 1350
	end
  
  it "gives expected reading time of contents from readers reading speed per minute" do
		diary = DiaryEntry.new("Monday's entry", ("Today is a good day because I am testing! " * 150))
	  expect(diary.reading_time(60)).to eq 22.5
	end
	
	it "fails if given wpm of 0" do		
		diary = DiaryEntry.new("Monday's entry", ("Today is a good day because I am testing! " * 150))
	  expect { diary.reading_time(0) }.to raise_error "Reading speed must be above zero."
  end

	it "returns contents you can read in time given based on reading speed" do
		diary = DiaryEntry.new("Monday's entry", "Today is a good day because I am testing!")

	  expect(diary.reading_chunk(2, 1)).to eq "Today is"
	end

	it "returns next content block you can read in given time from furthest point read" do
		diary = DiaryEntry.new("Monday's entry", "Today is a good day!")

	  expect(diary.reading_chunk(2, 1)).to eq "Today is"
	  expect(diary.reading_chunk(2, 1)).to eq "a good"
	  expect(diary.reading_chunk(2, 1)).to eq "day!"
	end

	it "returns to beggning of contents once read through" do
		diary = DiaryEntry.new("Monday's entry", "Today is a good day!")

	  expect(diary.reading_chunk(2, 1)).to eq "Today is"
	  expect(diary.reading_chunk(2, 1)).to eq "a good"
	  expect(diary.reading_chunk(2, 1)).to eq "day!"
	  expect(diary.reading_chunk(2, 1)).to eq "Today is"
	end

	# it "returns next contents block from last word read in time given based on reading speed" do
	# 	diary = DiaryEntry.new("Monday's entry", "Today is a good day because I am testing!")

	#   expect(diary.reading_chunk(2, 1)).to eq "good day"
	# end
end

# take contents and split into words = []
# wpm * minutes = number of words could read in given time
# take words array and move first amount of words to new array and join as string 
# 
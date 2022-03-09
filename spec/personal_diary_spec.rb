require 'personal_diary'

RSpec.describe "make_snippet method" do
  it "returns first five words from input" do
    result = make_snippet("Today has been a wonderful day!")
    expect(result).to eq "Today has been a wonderful..."
  end
  it "returns the full string if string is less than five words" do
    result = make_snippet("Today is sunny")
    expect(result).to eq "Today is sunny"
  end
end

RSpec.describe "count_words method" do
  it "takes sting and count words" do
    result = count_words("This is my example string")
    expect(result).to eq 5
  end
end
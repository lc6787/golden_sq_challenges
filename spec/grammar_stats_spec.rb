require 'grammar_stats'


RSpec.describe GrammarStats do
  
  it "checks first and last characters are BOTH grammatically correct" do
    book = GrammarStats.new
    text = "The weather is clear outside!"
    expect(book.check(text)).to eq true
  end
  
    it "checks first and last characters are BOTH grammatically correct" do
    book = GrammarStats.new
    text = "The weather is clear outside?"
    expect(book.check(text)).to eq true
    end

  it "checks first and last characters are BOTH grammatically correct" do
    book = GrammarStats.new
    text = "The weather is clear outside."
    expect(book.check(text)).to eq true
  end
end

RSpec.describe GrammarStats do
  it "checks EITHER first or last characters are grammatically correct" do
    book = GrammarStats.new
    text = "The weather is clear outside"
    expect(book.check(text)).to eq false
  end

  it "checks EITHER first or last characters are grammatically correct" do
    book = GrammarStats.new
    text = "the weather is clear outside."
    expect(book.check(text)).to eq false
  end

  it "checks EITHER first or last characters are grammatically correct" do
    book = GrammarStats.new
    text = "the weather is clear outside?"
    expect(book.check(text)).to eq false
  end
  
  it "checks EITHER first or last characters are grammatically correct" do
    book = GrammarStats.new
    text = "the weather is clear outside!"
    expect(book.check(text)).to eq false
  end
end

RSpec.describe GrammarStats do
  it "totals number of texts checked initially" do
    book = GrammarStats.new
    expect(book.total_checks).to eq 0
  end

  it "totals number of texts checked after 2 checks" do
    book = GrammarStats.new
    text = "wow"
    text_2 = "Wow!"
    book.check(text)
    book.check(text_2)
    expect(book.total_checks).to eq 2
  end

  it "returns percentage of good checks with mixed results" do
    book = GrammarStats.new
    text = "wow"
    text_2 = "Wow!"
    text_3 = "Really?"
    book.check(text)
    book.check(text_2)
    book.check(text_3)
    expect(book.percentage_good).to eq 67
  end

  it "returns percentage of good checks when 100% true result" do
    book = GrammarStats.new
    text = "Really?"
    text_2 = "Wow!"
    book.check(text)
    book.check(text_2)
    expect(book.percentage_good).to eq 100
  end
end

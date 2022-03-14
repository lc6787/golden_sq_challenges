require 'm8_journal'

RSpec.describe "initially" do
  it "is a blank journal" do
    my_journal = Journal.new
  
    expect(my_journal.all).to eq []
  end

end
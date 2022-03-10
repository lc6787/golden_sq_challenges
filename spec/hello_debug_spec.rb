require 'hello_debug'

RSpec.describe "say_hello method" do
  it "returns personal greeting" do
    name = "Lauren"
    expect(say_hello(name)).to eq "Hello Lauren"
  end
end
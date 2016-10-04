require 'station'

describe Station do
  subject {described_class.new("Oxford Circus", 1)}
  it "knows station's name" do
    expect(subject.name).to eq("Oxford Circus")
  end

  it "knows station's zone" do
    expect(subject.zone).to eq(1)
  end
end

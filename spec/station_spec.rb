require 'station'

describe Station do
  it "initialized a new station with name and zone" do
    expect(subject.name).to be(@name)
    expect(subject.zone).to be(@zone)
  end

end

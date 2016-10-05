require 'journey'

describe Journey do
  describe "initialize" do
    let(:entry_station) {double :entry_station}
    let(:exit_station) {double :exit_station}
    subject { { :start => entry_station, :finish => exit_station } }
    it { should include(:start => entry_station, :finish => exit_station)  }
  end

  describe "#fare" do
    let(:entry_station) {double :entry_station}
    let(:exit_station) {double :exit_station}
    it "charge the right fare" do
    subject.entry_station != nil and subject.exit_station != nil
    expect{subject.fare}.eq 2
  end
  end
end

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
    subject(:journey) {described_class.new(:entry_station,:exit_station)}

    it "charge the right fare" do
    journey.entry_station != nil and journey.exit_station != nil
    expect(journey.fare).to eq 2
  end
  end
end

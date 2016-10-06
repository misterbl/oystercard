require 'journey'

describe Journey do
  let(:entry_station) {double :entry_station}
  let(:exit_station) {double :exit_station}
  subject(:completed_journey) {described_class.new(:entry_station,:exit_station)}
  subject(:started_journey) {described_class.new(:entry_station, nil)}
  describe "#fare" do
    it "charge the right fare" do
      expect(completed_journey.fare).to eq Journey::MIN_FARE
      expect(started_journey.fare).to eq Journey::PENALTY_FARE
    end
  end

  describe "#journey_complete?" do
    it "confirms that a journey is complete" do
      expect(completed_journey.journey_complete?).to be true
    end
  end

  describe "#finish" do
    it "set the journey exit station" do
      started_journey.finish(exit_station)
      expect(started_journey.exit_station).to eq(exit_station)
    end
  end

  describe '#fare_calc' do
    it 'returns 4 when going from 1 to 4' do
      completed_journey.entry_zone = 1
      completed_journey.exit_zone = 4
      expect(completed_journey.fare_calc).to eq(4)
    end
  end
end

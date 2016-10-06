require 'journeylog'

describe JourneyLog do

  let(:entry_station) {double :entry_station}
  let(:exit_station) {double :exit_station}
  let(:journey){double :journey}
  subject(:new_log) {described_class.new(:entry_station)}

  context 'start' do
    it 'should create a new journey with an entry station' do
      expect(new_log .start(entry_station)).to be_a_kind_of Journey
    end
  end

  context 'current_journey' do
    xit 'should return a journey' do
      new_log.start(entry_station)
      expect(new_log.current_journey).to eq subject.live_journey
    end
    xit 'should create a journey if current_journey is nil' do
      expect(new_log.current_journey).to be_a_kind_of Journey
    end
  end

  it {should respond_to :finish}

  it {should respond_to :journeys}
end

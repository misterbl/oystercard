require 'journeylog'

describe JourneyLog do

  let(:entry_station) {double :entry_station}
  let(:exit_station) {double :exit_station}

  context 'start' do
    it 'should create a new journey with an entry station' do
      expect(subject.start(entry_station)).to be_a_kind_of Journey
    end
  end

  context 'current_journey' do
    it 'should return a journey' do
      subject.start(entry_station)
      expect(subject.current_journey).to eq subject.live_journey
    end
    it 'should create a journey if current_journey is nil' do
      expect(subject.current_journey).to be_a_kind_of Journey
    end
  end

  it {should respond_to :finish}

  it {should respond_to :journeys}
end

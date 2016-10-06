require 'journeylog'

describe JourneyLog do
  it {should respond_to :log}
  let(:journey) {double :journey}

  before :each do
    @log = JourneyLog.new
  end

  describe '#log' do
    it 'save the journey history' do
      @log.log(journey)
      expect(@log.journey_history).to include journey
    end
  end
end

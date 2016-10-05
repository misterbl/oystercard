require 'journey'

describe Journey do
  describe "initialize" do
    let(:entry_station) {double :entry_station}
    let(:exit_station) {double :exit_station}
    subject { { :start => entry_station, :finish => exit_station } }
    it { should include(:start => entry_station, :finish => exit_station)  }
  end
end

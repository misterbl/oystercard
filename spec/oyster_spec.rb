require 'oyster'

describe Oyster do
  subject(:new_card) {described_class.new}
  subject(:topped_up_card) {described_class.new}
  subject(:touch_in_card) {described_class.new}
  let(@entry_station) {double :entry_station}
  let(@exit_station) {double :exit_station}
  
  before do
    topped_up_card.top_up(30)
    touch_in_card.top_up(30)
    touch_in_card.touch_in(entry_station)
    allow(@entry_station).to receive(:name).and_return('waterloo')
    allow(@entry_station).to receive(:zone).and_return(1)
    allow(@exit_station).to receive(:name).and_return('wembley')
    allow(@exit_station).to receive(:zone).and_return(4)
  end
  
  context "when initialized" do
    it "has a default balance" do
      expect(new_card.balance).to eq 0
    end
  end

  describe "#top_up" do
    context "when given a value" do
      it "adds value to balance" do
        before = new_card.balance
        expect(new_card.top_up(10)).to eq before + 10
      end
    end

    context "when value given exceeds the limit" do
      it "raises an error" do
        expect{topped_up_card.top_up(70)}.to raise_error "Amount exceeds limit"
      end
    end
  end

  describe "#touch in" do
    it 'should create journey on touch in' do
      new_card.top_up(30)
      expect(new_card.touch_in(@entry_station)).to be_a_kind_of Journey
    end
  end
  describe "Insufficient fund error" do
    it "raise an error if insufficient balance" do
      expect { new_card.touch_in(@entry_station) }.to raise_error "Insufficient balance to travel"
    end
  end
  describe "#touch out" do
    it { is_expected.to respond_to(:touch_out).with(1).argument}
    it "expects touch out to finish the journey" do
      touch_in_card.touch_out(@exit_station)
      expect(touch_in_card.current_journey).not_to be nil
    end
  end
  describe "deduct fare" do
    it "expects touch out to reduce balance by 'fare'" do
      expect {touch_in_card.touch_out(@exit_station)}.to change{touch_in_card.balance}.by(-(Journey::MIN_FARE))
    end
  end
end

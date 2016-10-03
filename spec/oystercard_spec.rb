require 'oystercard'

describe Oystercard do
  subject(:oystercard) {described_class.new}

  it "returns oystercard with balance equal 0" do
    expect(subject.balance).to eq 0
  end

  describe "#top_up" do
    it { is_expected.to respond_to(:top_up).with(1).argument}
    it "accept a top up" do
    expect{ subject.top_up 10 }.to change{ subject.balance }.by 10
    end
  end


end

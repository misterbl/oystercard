require 'oyster'

describe Oyster do

  context "when initialized" do
    it "has a default balance" do
      expect(subject.balance).to eq 0
    end
  end

  describe "#top_up" do
      context "when given a value" do
      it "adds value to balance" do
        before = subject.balance
        expect(subject.top_up(10)).to eq before + 10
      end
    end

      context "when value given exceeds the limit" do
      it "raises an error" do
        subject.top_up(90)
        expect{subject.top_up(1)}.to raise_error "Amount exceeds limit"
      end
    end
  end

    describe "#touch in" do
      let(:entry_station) {double :entry_station}
        it { is_expected.to respond_to(:touch_in).with(1).argument}
        it "expects touch in to start a journey" do
        subject.top_up(30)
        subject.touch_in(entry_station)
        expect(subject).to be_in_journey
        end
    end
        let(:entry_station) {double :entry_station}
        it "Record the entry station" do
        subject.top_up(30)
        expect(subject.touch_in(entry_station)).to eq(entry_station)
        end

    describe "Insufficient fund error" do
      let(:entry_station) {double :entry_station}
      it "raise an error if insufficient balance" do
      expect { subject.touch_in(entry_station) }.to raise_error "Insufficient balance to travel"
      end
    end

    describe "#touch out" do
      let(:exit_station) {double :exit_station}
        it { is_expected.to respond_to(:touch_out).with(1).argument}
        it "expects touch out to finish the journey" do
        subject.touch_out(exit_station)
        expect(subject).not_to be_in_journey
        end
      describe "deduct fare" do
        let(:exit_station) {double :exit_station}
        it "expects touch out to reduce balance by 'fare'" do
          expect {subject.touch_out(exit_station)}.to change{subject.balance}.by(-2)
        end
      end
      describe "Record exit station" do
        let(:exit_station) {double :exit_station}
        it "Record the exit station" do
        expect(subject.touch_out(exit_station)).to eq(exit_station)
        end
      end
    end

      describe "#in_journey?" do
        it { is_expected.to respond_to(:in_journey?) }
      end
    end

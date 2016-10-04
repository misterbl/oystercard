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
        it { is_expected.to respond_to(:touch_in) }
        it "expects touch in to start a journey" do
        subject.top_up(30)
        subject.touch_in
        expect(subject).to be_in_journey
      end
      end

    describe "Insufficient fund error" do
      it "raise an error if insufficient balance" do
      expect { subject.touch_in }.to raise_error "Insufficient balance to travel"
      end
    end


    describe "#touch out" do
        it { is_expected.to respond_to(:touch_out) }
        it "expects touch out to finish the journey" do
        subject.touch_out
        expect(subject).not_to be_in_journey
        end
        it "expects touch out to reduce balance by 'fare'" do
          expect {subject.touch_out}.to change{subject.balance}.by(-2)
        end
    end

      describe "#in_journey?" do
        it { is_expected.to respond_to(:in_journey?) }
      end
    end

require 'oystercard'

describe Oystercard do

    it "Should create a blank Oyster card" do
        expect(subject.balance).to eq (0)
    end

    it 'Should add an amount to an Oystercard' do
      expect(subject.top_up(100)).to eq(subject.balance)
    end
end

require 'oystercard'

describe Oystercard do

    it "Should create a blank Oyster card" do
        expect(subject.balance).to eq (0)
    end

    it "Should add an amount to an Oystercard" do
        expect(subject.top_up(50)).to eq(subject.balance)
    end
    
    it "Should return an error if limit exceeded" do
        expect(subject.top_up(100)).to eq("Maximum balance exceeded of £#{subject.MAX_CARD_LIMIT}")
    end

end

require 'oystercard'

describe Oystercard do
    it "Should create a blank Oyster card" do
        expect(subject.new_card).to eq (0)
    end  
end
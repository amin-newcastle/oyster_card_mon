require 'oystercard'

describe Oystercard do

  it "Should create a blank Oyster card" do
    expect(subject.balance).to eq (50)
  end

  it "Should add an amount to an Oystercard" do
    expect(subject.top_up(10)).to eq(subject.balance)
  end
    
  it "Should return an error if limit exceeded" do
    expect(subject.top_up(100)).to eq("Maximum balance exceeded of £#{subject.MAX_CARD_LIMIT}")
  end

  it "Should deduct fare from Oystercard" do
    fare = 10
    expect(subject.deduct(fare)).to eq(subject.balance)
  end

  it { is_expected.to respond_to :in_journey?, :touch_in, :touch_out }

  it "Should check the state of the Oystercard in journey" do
    expect(subject.in_journey?).to eq(false)
  end

  it "Should change the state of the card to in journey(true)" do
    subject.touch_in()
    expect(subject).to be_in_journey
  end

  it "Should change the state of the card to 'not' in journey(false)" do
    subject.touch_in()
    subject.touch_out()
    expect(subject).not_to be_in_journey
  end
end

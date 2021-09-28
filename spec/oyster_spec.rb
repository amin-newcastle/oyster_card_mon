require 'oystercard'

describe Oystercard do

before(:each) do 
    @my_card = Oystercard.new(50, 90)
end

  it "Should create a blank Oyster card" do
    expect(@my_card.balance).to eq (50)
  end

  it "Should add an amount to an Oystercard" do
    expect(@my_card.top_up(10)).to eq(@my_card.balance)
  end
    
  it "Should return an error if limit exceeded" do
    expect{@my_card.top_up(100)}.to raise_error"Maximum balance exceeded of £#{@my_card.MAX_CARD_LIMIT}"
  end

  it "Should deduct fare from Oystercard" do
    fare = 10
    expect(@my_card.deduct(fare)).to eq(@my_card.balance)
  end

  it "Should check the state of the Oystercard in journey" do
    expect(@my_card.in_journey?).to eq(false)
  end

  it "Should change the state of the card to in journey(true)" do
    @my_card.touch_in()
    expect(@my_card).to be_in_journey
  end

  it "Should change the state of the card to 'not' in journey(false)" do
    @my_card.touch_in()
    @my_card.touch_out()
    expect(@my_card).not_to be_in_journey
  end

  it "Should have the minimum balance of £1 for a single journey" do
    @my_card.balance = 0
    expect{@my_card.touch_in}.to raise_error"Insufficient funds must have minimum £1 balance"
  end
end

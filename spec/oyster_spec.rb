require 'oystercard'

describe Oystercard do

    let(:station) { double :station }
    let(:my_card) { Oystercard.new(50, 90, 1) }

    describe "#balance" do
        it "Should create a blank Oyster card" do
            expect(my_card.balance).to eq (50)
        end
    end

    describe "#top_up" do
        it "Should add an amount to an Oystercard" do
            expect(my_card.top_up(10)).to eq(my_card.balance)
        end
    
        it "Should return an error if limit exceeded" do
            expect{my_card.top_up(100)}.to raise_error"Maximum balance exceeded of £#{my_card.MAX_CARD_LIMIT}"
        end
    end

    describe "#deduct" do
        it "Should deduct fare from Oystercard" do
            fare = 10
            expect(my_card.send(:deduct, fare)).to eq(my_card.balance)
        end
    end

    describe "#in_journey?" do
        it "Should check the state of the Oystercard in journey" do
            expect(my_card.in_journey?).to eq(false)
        end
    end

    describe "#touch_in" do
        it "Should change the state of the card to in journey(true)" do
            my_card.touch_in(station)
            expect(my_card).to be_in_journey
        end

        it "Should have the minimum balance of £1 for a single journey" do
            my_card.balance = 0
            expect{my_card.touch_in(station)}.to raise_error"Insufficient funds must have minimum £1 balance"
        end

        it "Should remember the entry station after touch in" do
            my_card.touch_in(station)
            expect(my_card.entry_station).to eq(station)
        end
    end

    describe "#touch_out" do
        it "Should change the state of the card to 'not' in journey(false)" do
            my_card.touch_in(station)
            my_card.touch_out(station)
            expect(my_card).not_to be_in_journey
        end
    
        it "Should deduct the minimum fare of £1 from the card when touched out" do
            expect {my_card.touch_out(station)}.to change{my_card.balance}.by(-my_card.minimum_fare)
        end
    end

    describe "#record_journey" do
        it "Should show an empty list of journeys" do
            expect(my_card.record_journey).to eq (my_card.journey_history)
        end

        it "Should show entries of journey history in list the list of journeys" do
            my_card.touch_in("Newcastle")
            my_card.touch_out("Kings-Cross")
            expect(my_card.record_journey).to eq (my_card.journey_history)
        end
    end

end

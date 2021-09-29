require 'station'

describe Station do
    my_station = Station.new("Newcastle", 1)

    it "Should have a variable call name" do
        expect(my_station.name).to eq("Newcastle")  
    end

    it "Should have a variable call zone" do
        expect(my_station.zone).to eq(1)
    end
end
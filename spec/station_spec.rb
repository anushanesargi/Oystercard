require 'station'

describe Station do 

    it "returns the name of the station" do
        station = Station.new("Chiswick Park Station")
        expect(station.name).to eq "Chiswick Park Station"
    end

    it "returns the zone number of the station" do
        station = Station.new("Chiswick Park Station")
        expect(station.zone).to eq 1
    end

end
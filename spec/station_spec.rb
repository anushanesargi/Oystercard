require 'station'

describe Station do 

    it "returns the name of the station" do
        station = Station.new("Chiswick Park Station")
        expect(station.station_name).to eq "Chiswick Park Station"
    end

    it "returns the zone number of the station" do
        station = Station.new("Khiswick Park Station")
        expect(station.zone).to eq 3
    end

end
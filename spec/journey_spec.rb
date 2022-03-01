require 'journey'

describe Journey do

    it "touch_in should return the entry station" do
        entry_station = Station.new("Chiswick")
        journey = Journey.new
        expect(journey.touch_in(entry_station)).to eq entry_station
    end
    
    it "touch_out should return the exit station" do
        exit_station = Station.new("Aldgate East")
        journey = Journey.new
        expect(journey.touch_out(exit_station)).to eq exit_station
    end

    it "fare should return the charge for the complete journey" do
        entry_station = Station.new("Chiswick")
        exit_station = Station.new("Aldgate East")
        journey = Journey.new
        journey.touch_in(entry_station)
        journey.touch_out(exit_station)
        expect(journey.fare).to eq 3
    end

    describe ".in_jounery?" do
        it "should return true if in journey" do
            entry_station = Station.new("Chiswick")
            journey = Journey.new
            journey.touch_in(entry_station)
            expect(journey.in_journey?).to eq true
        end

    end

end
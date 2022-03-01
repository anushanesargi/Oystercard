require 'station'

describe Station do 

    it "saves the entry station" do
        oystercard = Oystercard.new
        station1 = Station.new
        expect(station.name
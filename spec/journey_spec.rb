require 'journey'

describe Journey do

    let(:station_1) {Station.new("Chiswick")}
    let(:station_2) {Station.new("Aldgate")}
    let(:station_3) {Station.new("Bank")}
    let(:station_4) {Station.new("Monument")}
    let(:journey) {Journey.new}

    describe ".touch_in" do
        it "touch_in should return the entry station" do
            journey.touch_in(station_1)
            expect(journey.entry_station).to eq station_1
        end
    end
    
    describe '.touch_out' do
        it "touch_out should return the exit station" do
            journey.touch_out(station_1)
            expect(journey.exit_station).to eq station_1
        end

        it "entry station should be nil after a journey is complete" do
            journey.touch_in(station_1)
            journey.touch_out(station_2)
            expect(journey.entry_station).to eq nil
        end
    end

    describe '.fare' do
        it "fare should return the charge for the complete journey" do
            journey.touch_in(station_1)
            journey.touch_out(station_2)
            expect(journey.fare).to eq 6
        end
    end

    describe ".in_journey?" do
        it "should return true if in journey" do
            journey.touch_in(station_1)
            expect(journey.in_journey?).to eq true
        end
    end

    describe ".journeys" do
        it "should return empty if no journeys undertaken" do
            expect(journey.journey_log.empty?).to eq true 
        end

        it 'journey log records a journey as a hash' do 
            journey.touch_in(station_1)
            journey.touch_out(station_2)
            expect(journey.journey_log).to eq [{station_1 => station_2}]
        end

        it 'completes a journey with no touch out' do 
            journey.touch_in(station_1)
            journey.touch_in(station_2)
            journey.touch_out(station_1)
            expect(journey.journey_log).to eq [{station_1 => nil}, {station_2 => station_1}]
        end
        
        it 'completes a journey with no touch in' do 
            journey.touch_out(station_1)
            expect(journey.journey_log).to eq [{nil => station_1}]
        end
    end

end
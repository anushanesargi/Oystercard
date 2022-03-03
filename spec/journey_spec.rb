require 'journey'

describe Journey do
    let(:station1) { double(:station1) }
    let(:station2) { double(:station2) }
    card = Oystercard.new
    card.top_up(50)

    describe ".touch_in" do
        it "touch_in should return the entry station" do
            journey = Journey.new(card)
            journey.touch_in(station1)
            expect(journey.entry_station).to eq station1
        end

        it 'raises an error when min bal of 1 is reached' do
            card.deduct(50)
            journey = Journey.new(card)
            expect { journey.touch_in(station1) }.to raise_error "Minimum balance of £1 required"
            card.top_up(50)
        end

        it "should return the penalty fare if there is no touch out" do
            allow(station1).to receive(:zone).and_return(1)
            journey = Journey.new(card)
            journey.touch_in(station1)
            expect(journey.fare).to eq 6
        end

    end
    
    describe '.touch_out' do
        it "touch_out should return the exit station" do
            journey = Journey.new(card)
            allow(journey).to receive(:fare).and_return(1)
            journey.touch_out(station1)
            expect(journey.exit_station).to eq station1
        end

        it "entry station should be nil after a journey is complete" do
            journey = Journey.new(card)
            allow(journey).to receive(:fare).and_return(1)
            journey.touch_in(station1)
            journey.touch_out(station1)
            expect(journey.entry_station).to eq nil
        end


    end

    describe ".fare" do 
        it "fare should return the charge for the complete journey" do
            allow(station1).to receive(:zone).and_return(1)
            allow(station2).to receive(:zone).and_return(1)
            journey = Journey.new(card)
            journey.touch_in(station1)
            journey.touch_out(station2)
            expect(journey.fare).to eq 1
        end

        it "should return the penalty fare if there is no touch out" do
            allow(station1).to receive(:zone).and_return(1)
            journey = Journey.new(card)
            journey.touch_in(station1)
            journey.touch_in(station1)
            journey.touch_out(station1)
            expect(journey.fare).to eq 1
        end

        it "should return the penalty fare if there is no touch in" do
            journey = Journey.new(card)
            journey.touch_out(station1)
            expect(journey.fare).to eq 6
        end

    end

    describe ".in_journey?" do
        it "should return true if in journey" do 
            journey = Journey.new(card)
            journey.touch_in(station1)
            expect(journey.in_journey?).to eq true
        end

    end

end
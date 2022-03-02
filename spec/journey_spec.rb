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

    # describe ".in_jounery?" do
    #     it "should return true if in journey" do
    #         entry_station = Station.new("Chiswick")
    #         journey = Journey.new
    #         journey.touch_in(entry_station)
    #         expect(journey.in_journey?).to eq true
    #     end

    # end

    describe ".journeys" do
        # it "should return empty if no journeys undertaken" do
        #     journey = Journey.new
        #     expect(journey.journey_hash.empty?).to eq true 
        # end


        it "should return the minimum fare if there is no touch out" do
            journey = Journey.new
            card = Oystercard.new
            card.top_up(10)
            station1 = Station.new("Chiswick Park Station")
            journey.touch_in(station1, card)
            expect(journey.fare).to eq 6
        end

        # it "should return the minimum fare if there is no touch in" do
        #     journey = Journey.new
        #     station1 = Station.new("Chiswick Park Station")
        #     journey.touch_out(station1)
        #     expect(journey.fare).to eq 6
        # end

        it 'returns the journey log' do 
            journey = Journey.new
            station1 = Station.new("Chiswick Park Station")
            station2 = Station.new("Aldgate East")
            card = Oystercard.new
            card.top_up(10)
            journey.touch_in(station1, card)
            journey.touch_out(station2, card)
            # journey.touch_in(station1, card)
            # journey.touch_out(station2, card)
            puts "--------------------"
            puts journey.journey_log
            puts "--------------------"
            expect(journey.journey_log).to eq [{station1 => station2}]
        end

        it 'returns the journey log' do 
            journey = Journey.new
            station1 = Station.new("Chiswick Park Station")
            station2 = Station.new("Aldgate East")
            card = Oystercard.new
            card.top_up(10)
            journey.touch_in(station1, card)
            journey.touch_in(station2, card)
            journey.touch_out(station1, card)
            puts "--------------------"
            puts journey.journey_log
            puts "--------------------"
            expect(journey.journey_log).to eq [{station1 => nil}, {station2 => station1}]
        end
        
        it 'returns the journey log' do 
            journey = Journey.new
            station1 = Station.new("Chiswick Park Station")
            station2 = Station.new("Aldgate East")
            card = Oystercard.new
            card.top_up(10)
            journey.touch_out(station1, card)
            puts "--------------------"
            puts journey.journey_log
            puts "--------------------"
            expect(journey.journey_log).to eq [{nil => station1}]
        end


    end

end
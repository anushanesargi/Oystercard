require 'journey'

describe Journey do

    describe ".touch_in" do
        it "touch_in should return the entry station" do
            entry_station = Station.new("Chiswick")
            journey = Journey.new
            my_card = Oystercard.new
            my_card.top_up(10)
            expect(journey.touch_in(entry_station, my_card)).to eq entry_station
        end

        it 'raises an error when min bal of 1 is reached' do
            journey = Journey.new
            station1 = Station.new("Chiswick")
            my_card = Oystercard.new
            expect { journey.touch_in(station1, my_card) }.to raise_error "Minimum balance of £1 required"
        end

    end
    
    describe '.touch_out' do
        # it "touch_out should return the exit station" do
        #     exit_station = Station.new("Aldgate East")
        #     journey = Journey.new
        #     expect(journey.touch_out(exit_station)).to eq exit_station
        # end

        # it "entry station should be nil after a journey is complete" do
        #     entry_station = Station.new("Chiswick")
        #     exit_station = Station.new("Aldgate East")
        #     journey = Journey.new
        #     journey.touch_in(entry_station)
        #     journey.touch_out(exit_station)
        #     expect(journey.entry_station).to eq nil
        # end


    end

    # it "fare should return the charge for the complete journey" do
    #     entry_station = Station.new("Chiswick")
    #     exit_station = Station.new("Aldgate East")
    #     journey = Journey.new
    #     journey.touch_in(entry_station)
    #     journey.touch_out(exit_station)
    #     expect(journey.fare).to eq 3
    # end

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


    end

end
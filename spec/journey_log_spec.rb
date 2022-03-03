require 'journey_log'
require 'oystercard'
require 'station'

describe JourneyLog do
    card = Oystercard.new 
    let(:journey) { Journey.new(card) }
    let(:station1) { Station.new("Chiswick Park Station") }
    let(:station2) { Station.new("Chiswick") }
    card.top_up(50)

    it 'should accept an entry station' do
        journey_log = JourneyLog.new(journey)
        expect(journey_log.start(station1)).to eq station1
    end

    describe '.finish' do
        it "should return an exit station" do
            journey_log = JourneyLog.new(journey)
            journey_log.start(station1)
            expect(journey_log.finish(station1)).to eq journey_log.journeys
        end
    end

    # describe '.journeys' do
    #     it "should return journeys" do
    #         journey_log = JourneyLog.new(journey)
    #         journey_log.start(station1)
    #         journey_log.finish(station2)
    #         expect(journey_log.journeys).to eq station1 => station2
    #     end
    # end
end
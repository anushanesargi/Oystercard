require_relative 'journey'

class JourneyLog
    attr_reader :journeys

    def initialize(journey_instance)
        @journey = journey_instance
        @journeys = []
    end

    def start(entry_station)
        @journey.touch_in(entry_station)
    end

    def finish(exit_station)
        @journey.touch_out(exit_station)
        current_journey
    end


    private

    def current_journey
        @journeys << @journey.journeys
    end

end
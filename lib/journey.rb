class Journey

    attr_reader :entry_station, :journey_log, :exit_station

    def initialize
        @entry_station
        @exit_station
        @journey_log = []
        @total_fare = []
        @card = Oystercard.new
    end

    def touch_in(entry_station)
        @card.minimum_balance?
        touch_out(nil) if in_journey?
        @entry_station = entry_station
        
    end

    def touch_out(exit_station)
        @exit_station = exit_station
        journeys
        @card.deduct(fare)
        @entry_station = nil
    
    end

    def fare
        @current_journey.each do |key, val|
            if key == nil || val == nil
                @total_fare << 6
            else
                @total_fare << ((key.zone - val.zone).abs + 3)
            end
        end

        return @total_fare.sum
    end

    def in_journey?
        @entry_station != nil
    end

    def journeys
        @current_journey = { @entry_station => @exit_station }
        @journey_log << @current_journey 
    end
end
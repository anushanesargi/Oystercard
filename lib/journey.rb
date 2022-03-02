require_relative 'station'

class Journey

    attr_reader :entry_station, :journey_hash

    def initialize
        @entry_station
        @exit_station
        @journey_hash = {}
        @total_fare = []
    end

    def touch_in(entry_station)
        @entry_station = entry_station
        journeys
        return @entry_station
    end

    def touch_out(exit_station)
        @exit_station = exit_station
        journeys
        @entry_station = nil
        return @exit_station
    end

    def fare
        @journey_hash.each do |key, val|
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
        journey1 = { @entry_station => @exit_station }
        @journey_hash.merge!(journey1)
    end



end
require_relative 'station'

class Journey

    def initialize
        @entry_station
        @exit_station
    end

    def touch_in(entry_station)
        @entry_station = entry_station
    end

    def touch_out(exit_station)
        @exit_station = exit_station
    end

    def fare
       (@entry_station.zone - @exit_station.zone).abs + 3
    end

    def in_journey?
        @entry_station != nil
    end



end
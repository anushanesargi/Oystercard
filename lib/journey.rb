require_relative 'station'
require_relative 'oystercard'

class Journey

    attr_reader :entry_station, :exit_station

    def initialize(oystercard)
        @card = oystercard
        @entry_station
        @exit_station
        @current_journey = { }
    end

    def touch_in(entry_station)
        @card.minimum_balance?
        touch_out(nil) if in_journey?
        @entry_station = entry_station
    end

    def touch_out(exit_station)
        @exit_station = exit_station
        journeys
        @entry_station = nil
        @card.deduct(fare)
    end

    def fare
        total_fare = 0
        @current_journey.each do |key, val|
            if key == nil || val == nil
                total_fare = 6
                break
            else
                total_fare = (key.zone - val.zone + 1)
            end
        end
      return total_fare
    end

    def in_journey?
        return @entry_station != nil
    end

    # def journeys
    #     if exit_station != nil
    #         @current_journey = { @entry_station => @exit_station }
    # end

    def journeys
        @current_journey = { @entry_station => @exit_station }
    end


end
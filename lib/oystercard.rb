class Oystercard
    MAX_BAL = 90
    MIN_BAL = 1

    attr_reader :balance, :entry_station, :exit_station, :journey_hash
    
    def initialize
        @balance = 0.0
        @entry_station
        @exit_station
        @count = 0
        @journey_hash = {}
    end

    def top_up(top_up_amt)
        maximum_balance?(top_up_amt)
        @balance += top_up_amt
    end

    def touch_in(entry_station)
        @entry_station = entry_station
        minimum_balance?
    end

    def touch_out(exit_station, charge = 2)
        deduct(charge)
        @exit_station = exit_station
        journeys
        @entry_station = nil 
    end

    def in_journey?
        @entry_station != nil
    end

    def journeys
        journey1 = { @entry_station => @exit_station }
        @journey_hash.merge!(journey1)
    end
    
    private

    def deduct(amt_to_deduct)
        @balance -= amt_to_deduct
    end

    

    def minimum_balance?
        fail "Minimum balance of £1 required" if @balance < MIN_BAL
    end

    def maximum_balance?(top_up_amt)
        if @balance + top_up_amt > MAX_BAL
            fail "Maximum balance exceeded by #{(MAX_BAL - @balance - top_up_amt).abs}"
        end
    end

end
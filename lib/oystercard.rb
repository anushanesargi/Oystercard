class Oystercard
    MAX_BAL = 90
    MIN_BAL = 1

    attr_reader :balance, :entry_station
    
    def initialize
        @balance = 0.0
        @entry_station
        @count = 0
    end

    def top_up(top_up_amt)
        maximum_balance?(top_up_amt)
        @balance += top_up_amt
    end

    def touch_in(entry_station)
        @entry_station = entry_station
        minimum_balance?
    end

    def touch_out(charge = 2)
        deduct(charge)
        @entry_station = nil 
    end

    def in_journey?
        @entry_station != nil
    end

    def journeys
        journey_hash = {}
        journey_hash.empty?
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
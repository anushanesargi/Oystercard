class Oystercard
    MAX_BAL = 90
    MIN_BAL = 1

    attr_reader :balance
    
    def initialize
        @balance = 0.0
    end

    def top_up(top_up_amt)
        maximum_balance?(top_up_amt)
        @balance += top_up_amt
    end

    def touch_in(condition = "yes")
        minimum_balance?
        condition == "yes"
    end

    def touch_out(condition = "no", charge = 2)
        deduct(charge)
        condition == "no"
    end

    def in_journey?
        touch_in == true && touch_out == true
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
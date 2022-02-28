class Oystercard
    MAX_BAL = 90
    
    attr_reader :balance
    
    def initialize
        @balance = 10
    end

    def top_up(top_up_amt)
        maximum_balance?(top_up_amt)
        @balance += top_up_amt
    end

    def deduct(amt_to_deduct)
        @balance -= amt_to_deduct
    end

    def touch_in
        touch_in = true
    end

    def touch_out
        touch_out = true
    end

    def maximum_balance?(top_up_amt)
        if @balance + top_up_amt > MAX_BAL
            fail "Maximum balance exceeded by #{(MAX_BAL - @balance - top_up_amt).abs}"
        end
    end

end
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

    def maximum_balance?(top_up_amt)
        fail "Maximum balance exceeded" if @balance + top_up_amt > MAX_BAL
    end


end
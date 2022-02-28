class Oystercard
    attr_reader :balance
    
    def initialize
        @balance = 10
    end

    def top_up(top_up_amt)
        @balance += top_up_amt
    end
end
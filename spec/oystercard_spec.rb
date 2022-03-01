require 'oystercard'

describe Oystercard do
    it 'has a balance of ten' do
        oystercard = Oystercard.new
        expect(oystercard.balance).to eq 10
    end

    it 'top_up the balance' do
        oystercard = Oystercard.new
        expect(oystercard.top_up(5)).to eq 15
    end

    it 'raise an error when the maximum balance is exceeded, max_bal = 90' do
        oystercard = Oystercard.new
        expect { oystercard.top_up(81) }.to raise_error "Maximum balance exceeded by 1.0"
    end

    it 'deducts the money from the balance' do
        oystercard = Oystercard.new
        expect(oystercard.deduct(2)).to eq 8
    end

    it 'returns true if touched in' do
        oystercard = Oystercard.new
        expect(oystercard.touch_in).to eq true
    end

    it 'returns true if touched out' do
        oystercard = Oystercard.new
        expect(oystercard.touch_out("yes")).to eq false
    end

    it 'returns true if in journey' do
        oystercard = Oystercard.new
        oystercard.touch_in
        expect(oystercard.in_journey?).to eq true
    end

    it 'raises an error when min bal of 1 is reached' do
        oystercard = Oystercard.new
        oystercard.deduct(9.2)
        expect { oystercard.touch_in }.to raise_error 'Minimum balance of £1 required'
    end
end
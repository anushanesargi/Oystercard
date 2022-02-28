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
        expect { oystercard.top_up(81) }.to raise_error "Maximum balance exceeded by 1"
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
        expect(oystercard.touch_out).to eq true
    end

end
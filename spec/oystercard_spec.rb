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


end
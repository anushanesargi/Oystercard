require 'oystercard'

describe Oystercard do
    
    let(:oystercard) { Oystercard.new }

    it 'has a balance of ten' do
        expect(oystercard.balance).to eq 10.0
    end

    it 'top_up the balance' do
        expect(oystercard.top_up(5)).to eq 15.0
    end

    it 'raise an error when the maximum balance is exceeded, max_bal = 90' do
        expect { oystercard.top_up(81) }.to raise_error "Maximum balance exceeded by 1.0"
    end

    it 'reduces th balance by fare that needs to be deducted' do
        fare = 2
        expect { oystercard.deduct(fare) }.to change { oystercard.balance }.by -fare 
    end


end
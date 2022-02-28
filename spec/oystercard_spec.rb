require 'oystercard'

describe Oystercard do
    it 'has a balance of ten' do
        expect(subject.balance).to eq 10
    end
    
end
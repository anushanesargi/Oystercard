require 'oystercard'

describe Oystercard do
    let(:chiswick_park_station) { double(:Station1) }
    let(:aldgate_east) { double(:Station2) }
    let(:chiswick) { double(:Station3) }
    let(:turnham_green) { double(:Station4) }

    it 'has a balance of ten' do
        oystercard = Oystercard.new
        expect(oystercard.balance).to eq 0.0
    end

    it 'top_up the balance' do
        oystercard = Oystercard.new
        expect(oystercard.top_up(5)).to eq 5.0
    end

    it 'raise an error when the maximum balance is exceeded, max_bal = 90' do
        oystercard = Oystercard.new
        expect { oystercard.top_up(91) }.to raise_error "Maximum balance exceeded by 1.0"
    end

    it 'returns true if in journey' do
        oystercard = Oystercard.new
        oystercard.top_up(10)
        oystercard.touch_in(chiswick_park_station)
        expect(oystercard.in_journey?).to eq true
    end

    it 'raises an error when min bal of 1 is reached' do
        oystercard = Oystercard.new
        expect { oystercard.touch_in(chiswick_park_station) }.to raise_error 'Minimum balance of £1 required'
    end

    it 'expect to charge £2 for the journey' do
        oystercard = Oystercard.new
        oystercard.top_up(10)
        oystercard.touch_in(chiswick_park_station)
        expect { oystercard.touch_out(aldgate_east) }.to change{ oystercard.balance }.by -2
    end

    it 'return the entry station' do
        oystercard = Oystercard.new
        oystercard.top_up(10)
        oystercard.touch_in(chiswick_park_station)
        expect(oystercard.entry_station).to eq chiswick_park_station
    end

    it 'return the entry station' do
        oystercard = Oystercard.new
        oystercard.top_up(10)
        oystercard.touch_in(chiswick_park_station)
        oystercard.touch_out(aldgate_east)
        expect(oystercard.entry_station).to eq nil
    end

    it 'returns true if journeys is empty' do 
        oystercard = Oystercard.new
        oystercard.top_up(10)
        expect(oystercard.journey_hash.empty?).to eq true
    end

    it 'returns true if journeys is empty' do 
        oystercard = Oystercard.new
        oystercard.top_up(10)
        oystercard.touch_in(chiswick_park_station)
        oystercard.touch_out(aldgate_east)
        expect(oystercard.journey_hash).to eq chiswick_park_station => aldgate_east
    end

    it 'returns true is journeys is empty' do 
        oystercard = Oystercard.new
        oystercard.top_up(10)
        oystercard.touch_in(chiswick_park_station)
        oystercard.touch_out(aldgate_east)
        oystercard.touch_in(chiswick)
        oystercard.touch_out(turnham_green)
        expect(oystercard.journey_hash).to eq chiswick_park_station => aldgate_east, chiswick => turnham_green
    end

end
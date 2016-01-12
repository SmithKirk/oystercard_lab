require 'oystercard'

describe Oystercard do

  subject(:oystercard) {described_class.new}
  let (:station) {double :station}

  it 'new card has balance' do
    expect(oystercard.balance).to eq 0
  end

  it 'top up balance' do
    expect{oystercard.top_up(10)}.to change{oystercard.balance}.by(10)
  end

  it 'raise error if £90 limit exceeded' do
    oystercard.top_up(90)
    expect{oystercard.top_up(1)}.to raise_error "Oystercard limit is £90"
  end

  it 'balance reduced by fare' do
    expect{oystercard.touch_out(station)}.to change{oystercard.balance}.by(-Oystercard::FARE)
  end

  it 'touch_in changes in journey? to true' do
    oystercard.top_up(90)
    oystercard.touch_in(station)
    expect(oystercard.in_journey).to eq true
  end

  it 'touch_out changes in journey? to true' do
    oystercard.top_up(90)
    oystercard.touch_in(station)
    oystercard.touch_out(station)
    expect(oystercard.in_journey).to eq false
  end

  it 'will not touch in if below minimum balance' do
    expect{oystercard.touch_in(station)}.to raise_error "Card below £1 minimum"
  end

end

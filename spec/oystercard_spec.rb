require 'oystercard'

describe Oystercard do

  subject(:oystercard) {described_class.new}
  let (:station) {double :station}
  let (:fare) {Oystercard::FARE}
  let (:in_station) {double :in_station}
  let (:out_station) {double :out_station}


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
    expect{oystercard.touch_out(station)}.to change{oystercard.balance}.by(-fare)
  end

  it 'touch_in changes in journey? to true' do
    oystercard.top_up(90)
    oystercard.touch_in(station)
    expect(oystercard.in_journey?).to eq true
  end

  it 'touch_out changes in journey? to true' do
    oystercard.top_up(90)
    oystercard.touch_in(station)
    oystercard.touch_out(station)
    expect(oystercard.in_journey?).to eq false
  end

  it 'will not touch in if below minimum balance' do
    expect{oystercard.touch_in(station)}.to raise_error "Card below £1 minimum"
  end

  it 'entry station is stored on touch in' do
    oystercard.top_up(90)
    oystercard.touch_in(station)
    expect(oystercard.in_station).to eq station
  end

  it 'entry station cleared on touch out' do
    oystercard.top_up(90)
    oystercard.touch_in(station)
    oystercard.touch_out(station)
    expect(oystercard.in_station).to eq nil
  end

  it 'exit station is stored on touch_out' do
    oystercard.top_up(90)
    oystercard.touch_in(station)
    oystercard.touch_out(station)
    expect(oystercard.out_station).to eq station
  end

  it 'a new card has an empty journey list' do
    expect(oystercard.travel_record).to be_empty
  end

  it 'start of journey stored' do
    oystercard.top_up(90)
    oystercard.touch_in(in_station)
    oystercard.touch_out(out_station)
    expect(oystercard.active_trip[:in]).to eq in_station
  end

  it 'end of journey stored' do
    oystercard.top_up(90)
    oystercard.touch_in(in_station)
    oystercard.touch_out(out_station)
    expect(oystercard.active_trip[:out]).to eq out_station
  end

end

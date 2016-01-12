require 'oystercard'

describe Oystercard do

  subject(:oystercard) {described_class.new}

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
    expect{oystercard.touch_out(10)}.to change{oystercard.balance}.by(-10)
  end
end

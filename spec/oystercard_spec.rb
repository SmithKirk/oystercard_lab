require 'oystercard'

describe Oystercard do

  subject(:oystercard) {described_class.new}

  it 'new card has balance' do
    expect(oystercard.balance).to eq 0
  end

  it 'top up balance' do
    expect{oystercard.top_up(10)}.to change{oystercard.balance}.by(10)
  end
end

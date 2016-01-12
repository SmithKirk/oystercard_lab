describe 'User Stories' do

  let(:oystercard){Oystercard.new}
  # In order to use public transport
  # As a customer
  # I want money on my card
  it 'card has a balance'do
    expect(oystercard.balance).to eq 0
  end

  # In order to keep using public transport
  # As a customer
  # I want to add money to my card
  it 'top up card' do
    expect{oystercard.top_up(10)}.to change{oystercard.balance}.by(10)
  end

  # In order to protect my money
  # As a customer
  # I don't want to put too much money on my card
  it 'cannot top up card beyond £90 limit' do
    oystercard.top_up(90)
    expect{oystercard.top_up(1)}.to raise_error "Oystercard limit is £90"
  end

  # In order to pay for my journey
  # As a customer
  # I need my fare deducted from my card
  it 'fare is dedeucted from card' do
    expect{oystercard.touch_out(10)}.to change{oystercard.balance}.by(-10)
  end

  # In order to get through the barriers
  # As a customer
  # I need to touch in and out
  #
  # In order to pay for my journey
  # As a customer
  # I need to have the minimum amount for a single journey
  #
  # In order to pay for my journey
  # As a customer
  # I need to pay for my journey when it's complete
  #
  # In order to pay for my journey
  # As a customer
  # I need to know where I've travelled from
  #
  # In order to know where I have been
  # As a customer
  # I want to see to all my previous trips
  #
  # In order to know how far I have travelled
  # As a customer
  # I want to know what zone a station is in
  #
  # In order to be charged correctly
  # As a customer
  # I need a penalty charge deducted if I fail to touch in or out
  #
  # In order to be charged the correct amount
  # As a customer
  # I need to have the correct fare calculated
end

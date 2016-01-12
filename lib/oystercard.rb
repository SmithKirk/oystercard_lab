class Oystercard

  attr_reader :balance, :in_journey

  MAX_BAL = 90
  MIN_BAL = 1
  FARE = 1

  def initialize(balance = 0)
    @balance = balance
    @in_journey = false
  end

  def top_up(amount)
    fail "Oystercard limit is £#{Oystercard::MAX_BAL}" if @balance + amount > MAX_BAL
    @balance += amount
  end

  def touch_in(station)
    fail "Card below £1 minimum" if @balance < MIN_BAL
    @in_journey = true
  end

  def touch_out(station)
    @in_journey = false
    deduct(FARE)
  end


  private

  def deduct(fare)
    @balance -= fare
  end


end

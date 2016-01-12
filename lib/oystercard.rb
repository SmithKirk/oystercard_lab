class Oystercard

  attr_reader :balance, :in_journey

  MAX_BAL = 90

  def initialize(balance = 0)
    @balance = balance
    @in_journey = false
  end

  def top_up(amount)
    fail "Oystercard limit is £#{Oystercard::MAX_BAL}" if @balance + amount > MAX_BAL
    @balance += amount
  end

  def touch_in(station)
    @in_journey = true
  end

  def touch_out(station,fare)
    @in_journey = false
    deduct(fare)
  end


  private

  def deduct(fare)
    @balance -= fare
  end


end

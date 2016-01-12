class Oystercard

  attr_reader :balance

  MAX_BAL = 90

  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(amount)
    fail "Oystercard limit is £#{Oystercard::MAX_BAL}" if @balance + amount > MAX_BAL
    @balance += amount
  end

  def touch_out(fare)
    deduct(fare)
  end


  private

  def deduct(fare)
    @balance -= fare
  end


end

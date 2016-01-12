class Oystercard

  attr_reader :balance, :in_journey
  attr_accessor :in_station, :out_station, :travel_record, :active_trip

  MAX_BAL = 90
  MIN_BAL = 1
  FARE = 1

  def initialize(balance = 0)
    @balance = balance
    @in_station = nil
    @out_station = nil
    @active_trip = {}
    @travel_record = {}
  end

  def top_up(amount)
    fail "Oystercard limit is £#{Oystercard::MAX_BAL}" if @balance + amount > MAX_BAL
    @balance += amount
  end

  def in_journey?
    !!in_station
  end

  def touch_in(in_station)
    fail "Card below £1 minimum" if @balance < MIN_BAL
    @in_station = in_station
    @active_trip[:in] = in_station
  end

  def touch_out(out_station)
    deduct(FARE)
    @out_station = out_station
    @active_trip[:out] = out_station
    @travel_record[@travel_record.length + 1] = @active_trip
    @in_station = nil
    @active_trip = {}
  end






  private

  def deduct(fare)
    @balance -= fare
  end


end

require 'journey'

class Oyster
  attr_reader :balance, :limit, :entry_station, :exit_station, :journeys

  MAXIMUM_LIMIT = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "Amount exceeds limit" if amount + @balance > MAXIMUM_LIMIT
    @balance += amount
    return @balance
  end

  def touch_in(entry_station)
    raise "Insufficient balance to travel" if @balance < MIN_BALANCE
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct(2)
    @exit_station = exit_station
    @entry_station = nil
    @exit_station
  end

  def in_journey?
    !!entry_station
  end

  private
  def deduct(amount)
    @balance -= amount
  end
end

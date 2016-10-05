require_relative 'journey'
require_relative 'station'
class Oyster
  attr_reader :balance, :limit, :entry_station, :exit_station
  MAXIMUM_LIMIT = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @current_journey = nil
  end

  def top_up(amount)
    raise "Amount exceeds limit" if amount + @balance > MAXIMUM_LIMIT
    @balance += amount
    return @balance
  end

  def touch_in(entry_station)
    raise "Insufficient balance to travel" if @balance < MIN_BALANCE
    @current_journey = Journey.new(entry_station, nil)
  end

  def touch_out(exit_station)
    deduct(2)
    @current_journey.set_exit_station(exit_station)
    @current_journey = nil
  end

  def in_journey?
    !!@current_journey
  end

  private
  def deduct(amount)
    @balance -= amount
  end
end

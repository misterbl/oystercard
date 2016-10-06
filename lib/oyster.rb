require_relative 'journey'
require_relative 'station'
class Oyster
  attr_reader :balance, :limit, :entry_station, :exit_station, :current_journey
  MAXIMUM_LIMIT = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    reset_journey
    @journey_log = JourneyLog.new
  end

  def top_up(amount)
    raise "Amount exceeds limit" if amount + @balance > MAXIMUM_LIMIT
    @balance += amount
  end

  def touch_in(entry_station)
    raise "Insufficient balance to travel" if @balance < MIN_BALANCE
    @current_journey = Journey.new(entry_station, nil)
  end

  def touch_out(exit_station)
    @current_journey = Journey.new(nil, exit_station) if @current_journey.nil?
    deduct_fare(exit_station)
  end

  def log_journey
    @journey_log.log(@current_journey)
    reset_journey
  end

  private
    def reset_journey
      @current_journey = nil
    end

    def deduct_fare(exit_station)
      @balance -= (@current_journey.finish(exit_station))
    end
end

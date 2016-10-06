require_relative 'oyster'

class Journey

  attr_reader :entry_station, :exit_station
  attr_writer :entry_zone, :exit_zone
  MIN_FARE =1
  PENALTY_FARE = 6



  def initialize(entry_station, exit_station)
    @entry_station = entry_station.name
    @exit_station = exit_station.name
    @entry_zone = entry_station.zone
  end

  def set_exit_vars(exit_station)
    @exit_station = exit_station.name
    @exit_zone = exit_station.zone
  end

  def fare
    journey_complete? ? fare_calc : PENALTY_FARE
  end

  def fare_calc
    zone_diff = (@exit_zone - @entry_zone).abs
    1 + zone_diff
  end

  def journey_complete?
    !(@entry_station.nil? || @exit_station.nil?)
  end

  def finish (exit_station)
    set_exit_vars(exit_station)
    fare
  end
end

require_relative 'oyster'

class Journey

  attr_reader :entry_station, :exit_station
  MIN_FARE =1
  PENALTY_FARE = 6

@@journeys = []

  def initialize(entry_station, exit_station)
    @entry_station = entry_station
    @exit_station = exit_station
    @@journeys << self
  end

  def self.journeys
    @@journeys
  end

  def set_exit_station(exit_station)
    @exit_station = exit_station
  end

  def fare
    journey_complete? ? MIN_FARE : PENALTY_FARE
  end

  def journey_complete?
    !(@entry_station.nil? || @exit_station.nil?)
  end

  def finish (exit_station)
  set_exit_station(exit_station)
  fare
  end
end

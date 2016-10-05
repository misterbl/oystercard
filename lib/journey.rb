require_relative 'oyster'

class Journey

  attr_reader :entry_station, :exit_station

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
    if @entry_station = nil || @exit_station= nil
      fare = 6
    else
      fare = 2
    end
  end
end

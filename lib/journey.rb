require_relative 'oyster'

class Journey < Hash

@@journeys = []

  def initialize(entry_station, exit_station)
    @entry_station = entry_station
    @exit_station = exit_station
  end

    def create_journey
    self[:start] = @entry_station
    self[:finish] = @exit_station
    @@journeys << self
    end

  def self.journeys
    @@journeys
  end

  def fare
    if @entry_station = nil || @exit_station= nil
      fare = 6
    else
      fare = 2
    end
  end
end

class Journey
  attr_accessor :journey

@@journeys = []

  def initialize
    @journey = {:start => @entry_station, :finish => @exit_station}
    @@journeys << self
  end

  def self.journeys
    @@journeys
  end
end

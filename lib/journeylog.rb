require_relative 'journey'
class JourneyLog

  attr_reader :live_journey

  def initialize(journey)
    @journey = journey
    @journey_history= []
    @live_journey = nil
  end

  def start(entry_station)
    @live_journey = Journey.new(entry_station, nil)
  end

  def finish(exit_station)
    @live_journey.exit_station = exit_station
    current_journey

  end

  def journeys
    @journey_history << @live_journey
  end

  private
  def current_journey
   !@live_journey.exit_station.nil? ? journeys : Journey.new(nil,nil)
  end
end

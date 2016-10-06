require_relative 'journey'
class JourneyLog

  attr_reader :journey_history

  def initialize
    @journey_history = []
  end

  def log(journey)
    @journey_history << journey
  end

end

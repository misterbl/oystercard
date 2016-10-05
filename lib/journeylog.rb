class JourneyLog

  attr_reader :live_journey

  def initialize
    @journey_array = []
    @live_journey = nil
  end

  def start(entry_station)
    @live_journey = Journey.new(entry_station, nil)
  end

  def finish

  end

  def journeys

  end


  def current_journey
    if @live_journey.nil?
      @live_journey = Journey.new(nil,nil)
    else
       return @live_journey
    end
  end

end

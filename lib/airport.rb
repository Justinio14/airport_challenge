require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 40

  attr_accessor :arrivals, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @sunny = nil
    @arrivals = []
    @capacity = capacity
  end

def sunny
@sunny = Weather.new.sunshine
end

  def landed(plane)
      fail "Unable to land due to stormy weather" unless sunny
      fail "Airport full" if full?
      @arrivals << plane

  end

  def departure
    fail "Unable to depart due to stormy weather" unless sunny
    @arrivals.shift

  end


  def full?
    @arrivals.count >= @capacity
  end

end

require_relative 'bike'

class DockingStation 

  DEFAULT_CAPACITY = 20 

  attr_reader :bike
  attr_accessor :capacity

  def initialize
    @bikes = []
    @capacity = DEFAULT_CAPACITY
  end

  def release_bike
    raise 'Sorry, no bikes available.' if empty? 
    raise 'Sorry, this bike is broken.' if @bikes[0].broken?
    @bikes.pop unless @bikes[0].broken?
  end

  def dock(bike)
    raise 'Sorry, this station is full.' if full?
    @bikes << bike
  end

  private 

  

  def full? 
    @bikes.count == capacity
  end

  def empty? 
    @bikes.empty?
  end

end
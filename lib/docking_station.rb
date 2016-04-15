require_relative 'bike'

class DockingStation 

  attr_reader :bike

  def initialize 
    @bikes = []
  end

  def release_bike
    raise 'Sorry, no bikes available.' if empty? 
       @bikes.pop
  end

  def dock(bike)
    raise 'Sorry, this station is full.' if full?
    @bikes << bike
  end

  private 

  def full? 
    @bikes.count == 20
  end

  def empty? 
    @bikes.empty?
  end

end
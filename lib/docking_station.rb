require_relative 'bike'

class DockingStation 

  attr_reader :bike

  def initialize 
    @bikes = []
  end

  def release_bike
    if @bikes.empty?
      raise 'Sorry, no bikes available.'
    else
       @bikes.pop
    end
  end

  def dock(bike)
    fail 'Sorry, this station is full.' if @bikes.count == 20
    @bikes << bike
  end

end
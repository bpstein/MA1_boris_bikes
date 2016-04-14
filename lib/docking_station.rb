require_relative 'bike'

class DockingStation 

  attr_reader :bike 

  def release_bike
    if @bike 
      @bike 
    else
      raise 'Sorry, no bikes available.' 
    end
  end

  def dock(bike)
    fail 'Sorry, this station is full.' if @bike
    @bike = bike
  end

end
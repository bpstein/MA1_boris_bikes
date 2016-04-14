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
    @bike = bike
  end

end
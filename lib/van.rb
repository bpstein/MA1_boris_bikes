class Van

  attr_reader :van_bikes

  def initialize 
    @van_bikes = []
  end

  def take_broken_bikes(docking_station)
    taken = docking_station.bikes.map {|bike| bike.broken? }
    store_broken_bikes(taken)
  end

  def deliver_broken_bikes(garage)
    garage.hold_broken_bikes(van_bikes)
  end

  private 

  def store_broken_bikes(taken)
    van_bikes = taken
    return true if taken.length > 0 
    false
  end


end
class Van

  def take_broken_bikes(docking_station)
    taken = docking_station.bikes.map {|bike| bike.broken? }
    store_broken_bikes(taken)
  end

  private 

  def store_broken_bikes(taken)
    return true if taken.length > 0 
    false
  end
end
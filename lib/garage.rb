class Garage

  attr_accessor :bikes_to_repair

  def hold_broken_bikes(van_bikes)
    @bikes_to_repair = van_bikes
  end
end
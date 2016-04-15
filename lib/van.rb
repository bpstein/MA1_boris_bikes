require_relative 'garage'
require_relative 'docking_station'
require_relative 'bike'

class Van
  attr_reader :van_bikes

  def initialize
    @van_bikes = []
  end

  def take_broken_bikes(docking_station)
    taken = docking_station.bikes.select {|bike| bike.broken? }
    print "#{taken}"
    store_broken_bikes(taken)
  end

  def deliver_broken_bikes(garage)
    garage.hold_broken_bikes(van_bikes)
    van_bikes = []
  end

  def collect_working_bikes(garage)
    van_bikes = garage.fix_bikes
  end

  private

  def store_broken_bikes(taken)
    @van_bikes = taken
    return true if taken.length > 0
    false
  end


end

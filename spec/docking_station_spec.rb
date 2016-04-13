require 'docking_station'

describe DockingStation do
  
  it 'responds to release_bike' do
    is_expected.to respond_to :release_bike
  end

end
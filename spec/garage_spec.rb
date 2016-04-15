require 'garage'

describe Garage do 

  let(:working_bike)    { double :bike, broken?: false, working?: true }
  let(:broken_bike)     { double :bike, broken?: true }
  let(:docking_station) { double :docking_station, bikes: [working_bike, broken_bike]}

  describe 'stores broken bikes' do
    it 'stores broken bikes to be repaired' do 
      # subject.bikes_to_repair([broken_bike])
      expect(subject.hold_broken_bikes([broken_bike])).to eq [broken_bike]
    end
  end

end
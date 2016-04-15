require 'garage'

describe Garage do

  let(:working_bike)    { double :working_bike, broken?: false, working?: true }
  let(:broken_bike)     { double :broken_bike, broken?: true }
  let(:docking_station) { double :docking_station, bikes: [working_bike, broken_bike]}

  describe 'stores broken bikes' do
    it 'stores broken bikes to be repaired' do
      # subject.bikes_to_repair([broken_bike])
      expect(subject.hold_broken_bikes([broken_bike])).to eq [broken_bike]
    end
  end

  it 'can fix broken bikes' do
    expect(subject).to respond_to(:fix_bikes)
    #Look at this! And bike.rb
    #allow(broken_bike).to receive(:broken).with(false).and_return(working_bike)
    subject.hold_broken_bikes([broken_bike])
    #expect(subject.fix_bikes).to eq [working_bike]
  end

end



# garage.fix_bikes(broken_bikes)

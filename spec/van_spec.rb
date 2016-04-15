require 'van'

describe Van do

  let(:working_bike)    { double :working_bike, broken?: false, working?: true }
  let(:broken_bike)     { double :broken_bike, broken?: true }
  let(:docking_station) { double :docking_station, bikes: [working_bike, broken_bike]}
  let(:garage)          { double :garage, hold_broken_bikes: true }

  describe 'collecting broken bikes' do
    it 'responds to take_broken_bikes' do
      expect(subject).to respond_to :take_broken_bikes
    end

    it 'stores broken bikes' do
      expect(subject.take_broken_bikes(docking_station)).to eq true
    end

    it 'collects broken bikes from a specific docking station' do
      expect(subject).to respond_to(:take_broken_bikes).with(1).argument
      subject.take_broken_bikes(docking_station)
    end
  end

  it 'delivers broken bikes to a garage' do
    subject.take_broken_bikes(docking_station)
    expect(subject.deliver_broken_bikes(garage)).to eq []# subject.van_bikes.length > 0
  end

  it 'collect_working_bikes from garage' do
     #expect(subject).to respond_to(:collect_working_bikes).with(1).argument

    allow(garage).to receive(:fix_bikes).and_return([working_bike])
    expect(subject.collect_working_bikes(garage)).to eq [working_bike]
  end

  it 'returns working bikes to docking stations' do 
    expect(subject).to respond_to(:return_fixed_bikes).with(1).argument
    allow(docking_station).to receive(:dock).with(working_bike).and_return([working_bike])
    subject.van_bikes = [working_bike]
    expect(subject.return_fixed_bikes(docking_station)).to eq [working_bike]
  end

end


# my_object = MyObject.new
#   my_object.send(:do_things_with_message, some_message)
#   my_object.thing.should == true

# 2.2.1 :013 > van.collect_working_bikes(garage)
# 2.2.1 :014 > van.return_working_bikes(station)

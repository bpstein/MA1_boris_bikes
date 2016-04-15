require 'van'

describe Van do 

  let(:working_bike)    { double :bike, broken?: false, working?: true }
  let(:broken_bike)     { double :bike, broken?: true }
  let(:docking_station) { double :docking_station, bikes: [working_bike, broken_bike]}

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

    # it 'delivers broken bikes to garages' do 
    #   it 'responds to deliver_broken_bikes' do 
    #     expect(subject).to respond_to :deliver_broken_bikes
    #   end
    # end
  end

end


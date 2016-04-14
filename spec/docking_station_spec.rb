require 'docking_station'

describe DockingStation do
  
  context 'releasing a bike'
    it 'responds to release_bike' do
      expect(subject).to respond_to :release_bike
    end

    it 'releases a bike' do 
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike 
    end 

    it 'releases a bike that is working' do 
      bike = Bike.new
      expect(bike).to be_working
    end

    it 'raises an error when no bikes are available' do 
      expect { subject.release_bike }.to raise_error('Sorry, no bikes available.')
    end

  context 'docking a bike'
    it 'allows a bike to be docked' do 
      expect(subject).to respond_to(:dock).with(1).argument
    end

    it 'docks a bike' do 
      bike = Bike.new
      expect(subject.dock(bike)).to eq bike
    end

    it 'responds to bike' do 
      expect(subject).to respond_to :bike
    end

    it 'returns docked bikes' do 
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bike).to eq bike 
    end 

end
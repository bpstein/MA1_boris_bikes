require 'docking_station'

describe DockingStation do

  let(:bike)        { double :bike, broken?: false, working?: true }
  let(:lemon)       { double :bike, broken?: true }
  
  describe 'releasing a bike' do 
    it 'responds to release_bike' do
      expect(subject).to respond_to :release_bike
    end

    it 'releases a bike' do 
      subject.dock(bike)
      expect(subject.release_bike).to eq bike 
    end 

    it 'releases a bike that is working' do 
      expect(bike).to be_working
    end

    it 'raises an error when no bikes are available' do 
      expect { subject.release_bike }.to raise_error('Sorry, no bikes available.')
    end

    it 'raises an error when a bike is broken' do 
      subject.dock(lemon)
      expect { subject.release_bike }.to raise_error 'Sorry, this bike is broken.'
    end
  end

  describe 'docking a bike' do 
    it 'allows a bike to be docked' do 
      expect(subject).to respond_to(:dock).with(1).argument
    end

    it 'docks a bike' do 
      expect(subject.dock(bike)).to eq [bike]
    end

    it 'responds to bike' do 
      expect(subject).to respond_to :bikes
    end

    it 'returns docked bikes' do 
      subject.dock(bike)
      expect(bike).to eq bike
    end 

    it 'raises an error when a station is full' do 
      subject.capacity.times{ subject.dock(bike) }
      expect { subject.dock(bike) }.to raise_error('Sorry, this station is full.')
    end
  end

  describe 'initializing default station values' do 
    it 'has a default capacity when no explicit capacity is provided' do 
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
  end
end
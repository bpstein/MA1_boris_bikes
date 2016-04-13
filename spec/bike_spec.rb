require 'bike'

describe Bike do
  
  it 'is working?' do
    is_expected.to respond_to :working?
  end

end
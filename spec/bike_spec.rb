require 'bike'

describe Bike do
  
  it 'is working?' do
    expect(subject).to respond_to :working?
  end

  it 'responds to report broken' do 
    expect(subject).to respond_to :report_broken
  end

  it 'is reported to be broken' do
    subject.report_broken 
    expect(subject).to be_broken
  end

end
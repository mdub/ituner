require 'spec_helper'

describe ITuner::Track do
  
  before do
    @itunes = ITuner.itunes 
    @track = @itunes.current_track
  end

  it "has a name" do
    @track.name.should be_kind_of(String)
  end
  
  it "can be played" do
    @itunes.stop
    @track.play
    @itunes.should be_playing
  end
  
  after do
    @itunes.stop
  end

end

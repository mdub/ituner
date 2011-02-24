require 'spec_helper'

describe ITuner, "controls" do

  before do 
    @itunes = ITuner.itunes
  end
  
  it "is running" do
    @itunes.should be_running
  end
  
  it "can play" do
    @itunes.play
    @itunes.should be_playing
  end

  it "can pause" do
    @itunes.play
    @itunes.pause
    @itunes.should_not be_playing
  end

  describe "#current_track" do
    
    it "returns the current Track" do
      @itunes.play
      @itunes.current_track.should be_kind_of(ITuner::Track)
    end
    
    after do
      @itunes.stop
    end
    
  end

end

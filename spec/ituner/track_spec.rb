require 'spec_helper'

describe ITuner::Track do
  
  before do
    @itunes = ITuner.itunes 
    @track = @itunes.library.tracks["Freddie Freeloader"]
  end

  it "has a name" do
    @track.name.should == "Freddie Freeloader"
  end

  it "has an artist" do
    @track.artist.should == "Miles Davis"
  end

  it "has an album" do
    @track.album.should == "Kind Of Blue"
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

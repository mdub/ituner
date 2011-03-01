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

  it "has a uid" do
    @track.uid.should be_kind_of(Fixnum)
  end
  
  it "can be played" do
    @itunes.stop
    @track.play
    @itunes.should be_playing
  end
  
  describe ".find_by_uid" do
    
    context "with the uid of an existing track" do
      it "returns the track" do
        @reloaded_track = ITuner::Track.find_by_uid(@track.uid)
        @reloaded_track.name.should == @track.name
        @reloaded_track.uid.should == @track.uid
      end
    end

    context "with a bogus uid" do
      it "returns nil" do
        ITuner::Track.find_by_uid(99999999999).should == nil
      end
    end
    
  end
  
  after do
    @itunes.stop
  end

end

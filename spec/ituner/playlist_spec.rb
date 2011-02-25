require 'spec_helper'

describe ITuner::Playlist do

  before do
    @playlist = ITuner.itunes.playlists["Library"]
  end
  
  it "has a name" do
    @playlist.name.should == "Library"
  end

  it "has tracks" do
    @playlist.tracks.should be_kind_of(ITuner::Collection)
  end
  
  describe "#search" do
    
    it "returns matching tracks" do
      @playlist.search("FreeLoader").map(&:name).should include("Freddie Freeloader")
      @playlist.search("Nirvana").map(&:name).should include("Smells Like Teen Spirit")
    end
    
  end
  
end

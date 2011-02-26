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

    it "can be restricted" do
      @playlist.search("Nirvana", :artists).map(&:name).should include("Smells Like Teen Spirit")
      @playlist.search("Nirvana", :songs).map(&:name).should_not include("Smells Like Teen Spirit")
    end
    
  end

  describe ".create" do

    before do
      ITuner.itunes.playlists["XYZ"].delete rescue nil
    end
    
    it "creates a new playlist" do
      xyz = ITuner.itunes.playlists.create(:name => "XYZ")
      xyz.should be_kind_of(ITuner::Playlist)
      xyz.name.should == "XYZ"
      ITuner.itunes.playlists["XYZ"].should_not be_nil
    end
    
    after do
      ITuner.itunes.playlists["XYZ"].delete rescue nil
    end
    
  end
  
end

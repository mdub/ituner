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
  
  describe "#add" do
    
    before do 
      @playlist = ITuner.itunes.playlists.create(:name => "Test")
      @track = ITuner.itunes.music.tracks.first
    end

    after do 
      @playlist.delete
    end
    
    it "add a track to the playlist" do
      @playlist.add(@track)
      @playlist.tracks.size.should == 1
    end
  
  end
  
  describe "#clear" do

    before do 
      @playlist = ITuner.itunes.playlists.create(:name => "Test")
    end
    
    after do 
      @playlist.delete
    end

    it "removes all tracks" do 
      ITuner.itunes.music.tracks.take(3).each do |track|
        @playlist.add(track)
      end
      @playlist.tracks.size.should == 3
      @playlist.clear
      @playlist.tracks.size.should == 0
    end
    
  end
  
end

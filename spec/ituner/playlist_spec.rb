require 'spec_helper'

describe ITuner::Playlist do

  before do
    @playlist = ITuner.itunes.playlists["Recently Played"]
  end
  
  it "has a name" do
    @playlist.name.should == "Recently Played"
  end

  it "has tracks" do
    @playlist.tracks.should be_kind_of(ITuner::Collection)
  end
  
end

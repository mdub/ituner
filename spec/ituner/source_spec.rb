require 'spec_helper'

describe ITuner::Source do

  before do
    @source = ITuner.itunes.sources["Library"]
  end
  
  it "has a name" do
    @source.name.should == "Library"
  end

  describe "#playlists" do

    it "returns playlists" do
      @playlists = @source.playlists
      @playlists.should_not be_empty
      @playlists.each do |playlist|
        playlist.should be_kind_of(ITuner::Playlist)
      end
    end

  end

end
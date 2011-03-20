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

    describe ".find_or_create" do

      context "with the name of an existing playlist" do
        it "finds the existing one" do
          music = @source.music
          @source.playlists.find_or_create("Music").should == music
        end
      end

      context "with the name of a non-existant playlist" do

        it "creates a new one" do
          old_xxx = @source.playlists["XXX"]
          old_xxx.delete unless old_xxx.nil?
          new_xxx = @source.playlists.find_or_create("XXX")
          new_xxx.should be_kind_of(ITuner::Playlist)
          new_xxx.name.should == "XXX"
        end

      end

    end
    
  end

end
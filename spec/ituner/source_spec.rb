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

  describe "#main_playlist" do
    
    it "returns the main playlist" do
      @source.main_playlist.should be_kind_of(ITuner::Playlist)
      @source.main_playlist.name.should == @source.name
    end
    
  end
  
  describe "#search" do

    it "returns matching tracks" do
      @source.search("Nirvana").map(&:name).should include("Smells Like Teen Spirit")
    end

  end

end
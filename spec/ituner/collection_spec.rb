require 'spec_helper'

describe ITuner::Collection do
  
  before do
    @collection = ITuner.itunes.playlists
  end

  describe "#size" do
    it "returns the number of items" do
      size = @collection.size
      size.should be_kind_of(Integer)
      size.should be > 5
    end
  end

  it "can be indexed by name" do
    @collection["Library"].should be_kind_of(ITuner::Playlist)
  end

  it "can be indexed by position" do
    @collection[0].name.should == "Library"
  end

  it "can be enumerated" do
    @collection.should respond_to(:each)

    @count = 0
    @collection.each do |item|
      @count += 1
    end
    @count.should == @collection.size
  end
  
end

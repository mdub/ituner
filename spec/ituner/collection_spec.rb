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

  describe "#get" do
    
    describe "with a string" do

      it "returns the entry with matching name" do
        @collection["Library"].should be_kind_of(ITuner::Playlist)
        @collection["Library"].name.should == "Library"
      end

    end

    describe "with a number" do

      it "returns the entry in the referenced position" do
        @collection[0].name.should == "Library"
      end

    end

    describe "with a bogus name" do

      it "returns nil" do
        @collection["bogus"].should be_nil
      end

    end

    describe "with an out-of-bounds number" do

      it "returns nil" do
        @collection[666].should be_nil
      end

    end
    
  end
  
  
  it "can be enumerated" do
    @collection.should respond_to(:each)

    @count = 0
    @collection.each do |item|
      @count += 1
    end
    @count.should == @collection.size
  end

  it "is Enumerable" do
    @collection.should be_kind_of(Enumerable)
  end
  
  describe "#create" do

    before do
      @collection["XYZ"].delete rescue nil
    end
    
    it "creates a new item" do
      xyz = @collection.create(:name => "XYZ")
      xyz.should be_kind_of(ITuner::Playlist)
      xyz.name.should == "XYZ"
    end
    
    after do
      @collection["XYZ"].delete rescue nil
    end
    
  end

end

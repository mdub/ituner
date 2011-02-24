require 'spec_helper'

describe ITuner::Track do
  
  before do
    @track = ITuner.itunes.current_track
  end

  it "has a name" do
    @track.name.should be_kind_of(String)
  end
  
end

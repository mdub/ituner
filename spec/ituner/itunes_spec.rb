require 'spec_helper'

require 'ituner/itunes'

describe ITuner, ".itunes" do

  before do 
    @itunes = ITuner.itunes
  end
  
  it "is running" do
    @itunes.should be_running
  end
  
end

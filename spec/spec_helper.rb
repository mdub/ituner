require 'rspec'
require 'ituner'
require 'rr'
require 'rr/adapters/rspec'

module HaveReceivedSupport

  def have_received(method = nil)
    RR::Adapters::Rspec::InvocationMatcher.new(method)
  end
  
end

RSpec.configure do |config|

  config.mock_with :rr
  config.include HaveReceivedSupport
  
  config.after do
    ITuner.itunes.stop
  end
  
end


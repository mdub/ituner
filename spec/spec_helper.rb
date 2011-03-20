require 'rspec'
require 'ituner'

RSpec.configure do |config|

  config.mock_with :rr

  config.after do
    ITuner.itunes.stop
  end
  
end


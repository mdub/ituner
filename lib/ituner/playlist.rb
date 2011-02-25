require 'ituner/model'
require 'ituner/track'

module ITuner
  
  class Playlist < Model
    
    property :name
    
    collection :tracks, :of => Track
    
  end
  
end
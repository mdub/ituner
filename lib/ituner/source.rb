require 'ituner/model'
require 'ituner/playlist'

module ITuner
  
  class Source < Model
    
    property :name
    
    collection :playlists
    
  end
  
end
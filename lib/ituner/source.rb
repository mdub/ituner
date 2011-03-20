require 'ituner/model'
require 'ituner/playlist'

module ITuner
  
  class Source < Model
    
    property :name
    
    collection :playlists
    collection :tracks

    def music
      playlists["Music"]
    end
        
  end
  
end
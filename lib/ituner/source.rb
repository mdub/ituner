require 'ituner/model'
require 'ituner/playlist'

module ITuner
  
  class Source < Model
    
    property :name
    
    collection :playlists do
      
      def find_or_create(name)
        get(name) || create(:name => name)
      end
      
    end
    
    collection :tracks

    def music
      playlists["Music"]
    end
        
  end
  
end
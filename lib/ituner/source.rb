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
    
    def main_playlist
      playlists.detect { |playlist| playlist.name == self.name }
    end
    
    def search(*args)
      main_playlist.search(*args)
    end
    
    collection :tracks

    def music
      playlists["Music"]
    end
        
  end
  
end
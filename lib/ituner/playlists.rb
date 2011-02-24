require 'ituner/collection'
require 'ituner/playlist'

module ITuner
  
  class Playlists < Collection

    def instance(app_playlist)
      Playlist.new(app_playlist)
    end
    
  end
  
end

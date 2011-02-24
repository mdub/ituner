module ITuner
  
  class Playlist
    
    def initialize(app_playlist)
      @app_playlist = app_playlist
    end

    def name
      @app_playlist.name.get
    end
    
  end
  
end
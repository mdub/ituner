module ITuner
  
  class Playlist
    
    def initialize(app_playlist)
      @app_playlist = app_playlist
    end

    def name
      @app_playlist.name.get
    end
  
    def tracks
      Collection.new(@app_playlist.tracks, Track)
    end
    
  end
  
end
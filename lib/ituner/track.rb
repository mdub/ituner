module ITuner

  class Track

    def initialize(app_track)
      @app_track = app_track
    end

    def name
      @app_track.name.get
    end
    
    def play
      @app_track.play
    end

    def artist
      @app_track.artist.get
    end

    def album
      @app_track.album.get
    end
    
  end

end

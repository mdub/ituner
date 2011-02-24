require 'appscript'
require 'ituner/tracks'
require 'ituner/playlists'

module ITuner
  
  class << self

    def itunes
      @itunes ||= ITunes.new
    end
    
  end
  
  class ITunes
    
    def initialize
      @app = Appscript.app("iTunes.app")
    end

    def running?
      @app.is_running?
    end
    
    def play
      @app.play
    end

    def pause
      @app.pause
    end

    def stop
      @app.stop
    end

    def state
      @app.player_state.get
    end

    def playing?; state == :playing; end
    def paused?;  state == :paused;  end
    def stopped?; state == :stopped; end

    def current_track
      Track.new(@app.current_track.get)
    end
    
    def library
      playlists["Library"]
    end

    def playlists
      Playlists.new(@app.playlists)
    end
    
  end
  
end

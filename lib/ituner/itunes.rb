require 'appscript'
require 'ituner/collection'
require 'ituner/playlist'
require 'ituner/track'

module ITuner
  
  class << self
    
    def itunes_app
      @itunes_app ||= Appscript.app("iTunes")
    end

    def itunes
      ITunes.new(itunes_app)
    end
    
  end
  
  class ITunes < Model
    
    def running?
      app.is_running?
    end
    
    action :play
    action :pause
    action :stop

    def state
      app.player_state.get
    end

    def playing?; state == :playing; end
    def paused?;  state == :paused;  end
    def stopped?; state == :stopped; end

    def current_track
      Track.new(app.current_track.get)
    end
    
    collection :playlists, :of => Playlist

    def library
      playlists["Library"]
    end

    def music
      playlists["Music"]
    end

    private
    
    def app
      app_object
    end
    
  end
  
end

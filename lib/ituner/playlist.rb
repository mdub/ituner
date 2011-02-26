require 'ituner/model'
require 'ituner/track'

module ITuner
  
  class Playlist < Model
    
    property :name
    
    collection :tracks
    
    def search(name, only = :all)
      ITuner.itunes_app.search(app_object, :for => name, :only => only).map do |app_track|
        Track.new(app_track)
      end
    end
        
    def add(track)
      ITuner.itunes_app.duplicate(track.app_object, :to => app_object)
    end

  end
  
end
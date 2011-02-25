require 'ituner/model'
require 'ituner/track'

module ITuner
  
  class Playlist < Model
    
    property :name
    
    collection :tracks, :of => Track
    
    def search(name)
      app.search(app_object, :for => name).map do |app_track|
        Track.new(app, app_track)
      end
    end
    
  end
  
end
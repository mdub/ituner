require 'ituner/model'

module ITuner

  class Track < Model

    belongs_to :playlist, :container

    property :name
    property :artist
    property :album

    property :uid, :database_ID
    
    def play
      app_object.play(:once => true)
    end

    class << self

      include Appscript
      
      def find_by_uid(uid)
        app_track = ITuner.itunes_app.tracks[its.database_ID.eq(uid)].first.get
        Track.new(app_track)
      rescue CommandError
        nil
      end
      
    end
    
  end

end

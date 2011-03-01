require 'ituner/model'

module ITuner

  class Track < Model

    property :name
    property :artist
    property :album

    property :uid, :database_ID
    
    action :play

    class << self

      include Appscript
      
      def find_by_uid(uid)
        app_track = ITuner.itunes_app.tracks[its.database_ID.eq(uid)].first.get
        Track.new(app_track)
      rescue Appscript::CommandError
        nil
      end
      
    end
    
  end

end

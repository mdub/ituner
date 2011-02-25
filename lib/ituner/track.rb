require 'ituner/model'

module ITuner

  class Track < Model

    property :name
    property :artist
    property :album

    action :play
    
  end

end

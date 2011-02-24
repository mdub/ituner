module ITuner
  
  class << self

    def itunes
      @itunes ||= ITunes.new
    end
    
  end
  
  class ITunes
    
    def initialize
      require 'appscript'
      @app = Appscript.app("iTunes.app")
    end

    def running?
      @app.is_running?
    end
    
  end
  
end
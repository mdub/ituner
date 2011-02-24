module ITuner
  
  class Collection
    
    def initialize(app_collection)
      @app_collection = app_collection
    end
    
    def [](name)
      instance(@app_collection[name])
    end
    
  end
  
end
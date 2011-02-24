module ITuner
  
  class Collection
    
    def initialize(app_collection, item_class)
      @app_collection = app_collection
      @item_class = item_class
    end
    
    def [](name)
      wrap_item(@app_collection[name])
    end
    
    def first
      wrap_item(@app_collection.first.get)
    end

    private 
  
    def wrap_item(item)
      @item_class.new(item) if item
    end
    
  end
  
end
module ITuner
  
  class Collection
    
    def initialize(app, app_collection, item_class)
      @app = app
      @app_collection = app_collection
      @item_class = item_class
    end
    
    def [](index)
      wrap_item(@app_collection[translate_index(index)])
    end

    def translate_index(index)
      case index
      when Integer
        index + 1
      else
        index
      end
    end
    
    def size
      @app_collection.get.size
    end

    def each
      @app_collection.get.each do |item|
        yield wrap_item(item)
      end
    end
    
    def first
      wrap_item(@app_collection.first.get)
    end

    private 
  
    def wrap_item(item)
      @item_class.new(@app, item) if item
    end
    
  end
  
end
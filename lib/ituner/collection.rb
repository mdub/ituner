module ITuner
  
  class Collection
    
    def initialize(app_collection, item_type, item_class, &block)
      @app_collection = app_collection
      @item_type = item_type
      @item_class = item_class
      if block
        self.class.class_eval(&block)
      end
    end
    
    attr_reader :app_collection
    attr_reader :item_class
    attr_reader :item_type
    
    def [](index)
      wrap_item(app_collection[translate_index(index)])
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
      app_collection.get.size
    end

    def each
      app_collection.get.each do |item|
        yield wrap_item(item)
      end
    end
    
    def first
      wrap_item(app_collection.first.get)
    end

    def create(properties = {})
      wrap_item(ITuner.itunes_app.make(:new => item_type, :with_properties => properties))
    end
    
    private 
  
    def wrap_item(item)
      item_class.new(item) if item
    end
    
  end
  
end
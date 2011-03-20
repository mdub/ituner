module ITuner
  
  class Model
    
    def initialize(app_object)
      @app_object = app_object
    end

    attr_accessor :app_object

    def ==(other)
      other && (app_object == other.app_object)
    end
        
    def inspect
      s = "{" + self.class.name
      if respond_to?(:name)
        s += " #{name.inspect}"
      end
      s += "}"
      s
    end

    class << self
    
      def property(name, app_name = name)
        define_method(name) do
          app_object.send(app_name).get
        end
      end

      def collection(name, app_name = name, &block)
        item_type = name.to_s.sub(/s$/,'').to_sym
        item_class = ITuner.const_get(item_type.to_s.capitalize)
        define_method(name) do
          Collection.new(app_object.send(app_name), item_type, item_class, &block)
        end
      end
      
      def action(name, app_name = name)
        define_method(name) do |*args|
          app_object.send(app_name, *args)
        end
      end
      
    end

    action :delete
    
    property :kind
    
  end
  
end

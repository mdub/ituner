module ITuner
  
  class Model
    
    def initialize(app_object)
      @app_object = app_object
    end

    attr_accessor :app_object

    def ==(other)
      other && (app_object == other.app_object)
    end
    
    class << self
    
      def property(name)
        define_method(name) do
          app_object.send(name).get
        end
      end

      def collection(name)
        item_type = name.to_s.sub(/s$/,'').to_sym
        item_class = ITuner.const_get(item_type.to_s.capitalize)
        define_method(name) do
          Collection.new(app_object.send(name), item_type, item_class)
        end
      end
      
      def action(name)
        define_method(name) do |*args|
          app_object.send(name, *args)
        end
      end
      
    end

    action :delete
    
  end
  
end

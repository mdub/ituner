module ITuner
  
  class Model
    
    def initialize(app, app_object)
      @app = app
      @app_object = app_object
    end

    attr_accessor :app
    attr_accessor :app_object

    class << self
    
      def property(name)
        define_method(name) do
          app_object.send(name).get
        end
      end

      def collection(name, options = {})
        define_method(name) do
          Collection.new(app, app_object.send(name), options[:of])
        end
      end
      
      def action(name)
        define_method(name) do |*args|
          app_object.send(name, *args)
        end
      end
      
    end
    
  end
  
end

module Buildable
  module Initializer
    
    class Builder
      def initializer(clazz, methods)
        p 'c->' + clazz
        p 'm->' + methods
        @clazz = clazz.new
        methods.each do |method|
          p method
          eval <<-EOF
            def #{method}(*args)
              @clazz.#{method}(*args)
              self
            end
          EOF
        end 
      end
      def build
        @clazz
      end
    end

    def builder
      p self
      p self.class
      Builder.new(self, self.public_instance_methods(false).grep(/^.+=$/))
    end

  end
end

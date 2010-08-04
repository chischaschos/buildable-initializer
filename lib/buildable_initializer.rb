module Buildable
  module Initializer
    
    class Builder
      def initialize(clazz, methods)
        @clazz = clazz.new
        methods.collect{|m| m.to_s.chop!}.each do |method|
          p method
          eval <<-EOF
            def #{method}(*args)
              @clazz.#{method}=(args)
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
      Builder.new(self, self.public_instance_methods(false).grep(/^.+=$/))
    end

  end
end

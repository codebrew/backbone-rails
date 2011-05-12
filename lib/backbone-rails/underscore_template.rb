require 'tilt/template'

module Tilt
  class UnderscoreTemplate < Template
    self.default_mime_type = 'text/x-underscore-template'
    
    def initialize_engine
      require_template_library 'backbone-rails/underscore'
    end
    
    def prepare; end
    
    def evaluate(scope, locals, &block) 
      Underscore.render(name, data)
    end
    		
  end
end
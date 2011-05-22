require 'tilt/template'

module Tilt
  class JqueryTemplate < Template
    self.default_mime_type = 'text/x-jquery-tmpl'
    
    def initialize_engine
      require_template_library 'backbone-rails/jquery'
    end
    
    def prepare; end
    
    def evaluate(scope, locals, &block) 
      Jquery.render(name, data)
    end
    		
  end
end

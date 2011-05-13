module Backbone
  module Rails
    
    class Engine < ::Rails::Engine
      config.autoload_paths << File.expand_path("../backbone-rails", __FILE__)
      
      config.after_initialize do |app|
        app.assets.engines.register '.jst', Tilt::UnderscoreTemplate
      end
    end
    
  end
end

module Backbone
  module Rails

    class Engine < ::Rails::Engine      
      config.after_initialize do |app|
        app.assets.engines.register '.jst', Tilt::UnderscoreTemplate
      end
      
    end

  end
end

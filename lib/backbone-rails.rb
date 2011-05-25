require 'rails'

module BackboneRails
  class Engine < Rails::Engine
    # config.autoload_paths << File.expand_path("../backbone-rails", __FILE__)
    
    config.after_initialize do |app|
      # app.assets.register_engine '.jst', Tilt::UnderscoreTemplate
    end
  end
    
end

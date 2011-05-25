module Backbone
  module Generators
    class ModelGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("../templates", __FILE__)
      desc "This generator creates a backbone model"
    
      def create_backbone_model
        @model_namespace = [application_name.capitalize, "Models", class_name].join(".")
        @collection_namespace = [application_name.capitalize, "Collections", plural_name.capitalize].join(".")
      
        template "model.coffee", "app/assets/javascripts/backbone/models/#{file_name}.coffee"
      end
    
    end
  end
end
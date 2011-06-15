require 'generators/backbone/resource_helpers'
require 'generators/backbone/model/model_generator'

module Backbone
  module Generators
    class ScaffoldGenerator < Rails::Generators::NamedBase
      include Backbone::Generators::ResourceHelpers
      
      source_root File.expand_path("../templates", __FILE__)
      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"
      
      def create_controller_files 
        template 'controller.coffee', File.join(backbone_path, "controllers", class_path, "#{plural_name}_controller.coffee")
      end
      
      def create_view_files
        available_views.each do |view|
          template "views/#{view}_view.coffee", File.join(backbone_path, "views", plural_name, "#{view}_view.coffee")
          template "templates/#{view}.jst", File.join(backbone_path, "templates", plural_name, "#{view}.jst.ejs")       
        end
        
        template "views/model_view.coffee", File.join(backbone_path, "views", plural_name, "#{singular_name}_view.coffee")
        template "templates/model.jst", File.join(backbone_path, "templates", plural_name, "#{singular_name}.jst.ejs") 
      end
      
      def invoke_backbone_model_generator
        invoke Backbone::Generators::ModelGenerator, [class_name]
      end
      
      protected
        def available_views
          %w(index show new)
        end
        
    end
  end
end
require 'generators/backbone/model/model_generator'

module Backbone
  module Generators
    class ScaffoldGenerator < ModelGenerator
      
      source_root File.expand_path("../templates", __FILE__)
      desc "This generator creates the client side crud scaffolding"
      
      def create_controller_files 
        template 'controller.coffee', File.join(backbone_path, "controllers", class_path, "#{plural_name}_controller.js.coffee")
      end
      
      def create_view_files
        available_views.each do |view|
          template "views/#{view}_view.coffee", File.join(backbone_path, "views", plural_name, "#{view}_view.js.coffee")
          template "templates/#{view}.jst", File.join(backbone_path, "templates", plural_name, "#{view}.jst.ejs")       
        end
        
        template "views/model_view.coffee", File.join(backbone_path, "views", plural_name, "#{singular_name}_view.js.coffee")
        template "templates/model.jst", File.join(backbone_path, "templates", plural_name, "#{singular_name}.jst.ejs") 
      end
      
      protected
        def available_views
          %w(index show new edit)
        end
        
    end
  end
end
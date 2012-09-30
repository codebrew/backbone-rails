require 'generators/backbone/model/model_generator'

module Backbone
  module Generators
    class ScaffoldGenerator < ModelGenerator
      
      source_root File.expand_path("../templates", __FILE__)
      desc "This generator creates the client side crud scaffolding"
      
      def create_router_files 
        template "router.#{asset_suffix}", File.join(backbone_path, "routers", class_path, "#{plural_name}_router.#{asset_suffix}")
      end
      
      def create_view_files
        available_views.each do |view|
          template "views/#{view}_view.#{asset_suffix}", File.join(backbone_path, "views", plural_name, "#{view}_view.#{asset_suffix}")
          template "templates/#{view}.#{template_suffix}", File.join(backbone_path, "templates", plural_name, "#{view}.#{template_suffix}")       
        end
        
        template "views/model_view.#{asset_suffix}", File.join(backbone_path, "views", plural_name, "#{singular_name}_view.#{asset_suffix}")
        template "templates/model.#{template_suffix}", File.join(backbone_path, "templates", plural_name, "#{singular_name}.#{template_suffix}") 
      end
      
      protected
        def available_views
          %w(index show new edit)
        end
        
    end
  end
end

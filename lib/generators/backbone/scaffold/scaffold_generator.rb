require 'generators/backbone/model/model_generator'

module Backbone
  module Generators
    class ScaffoldGenerator < ModelGenerator
      
      source_root File.expand_path("../templates", __FILE__)
      desc "This generator creates the client side crud scaffolding"
      
      def create_router_files 
        template "router.#{script_extension}", File.join(backbone_path, "routers", class_path, "#{plural_name}_router.#{script_extension}")
      end
      
      def create_view_files
        available_views.each do |view|
          template "views/#{view}_view.#{script_extension}", File.join(backbone_path, "views", plural_name, "#{view}_view.#{script_extension}")
          template "templates/#{view}.jst", File.join(backbone_path, "templates", plural_name, "#{view}.jst.ejs")       
        end
        
        template "views/model_view.#{script_extension}", File.join(backbone_path, "views", plural_name, "#{singular_name}_view.#{script_extension}")
        template "templates/model.jst", File.join(backbone_path, "templates", plural_name, "#{singular_name}.jst.ejs") 
      end
      
      protected
        def available_views
          %w(index show new edit)
        end
        
    end
  end
end
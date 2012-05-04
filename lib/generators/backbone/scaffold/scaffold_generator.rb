require 'generators/backbone/model/model_generator'

module Backbone
  module Generators
    class ScaffoldGenerator < ModelGenerator
      
      class_option :pushstate, :type => :boolean, :default => false
      
      source_root File.expand_path("../templates", __FILE__)
      desc "This generator creates the client side crud scaffolding"
      
      def create_router_files
        if options[:pushstate]
          template 'router_ps.coffee', File.join(backbone_path, "routers", class_path, "#{file_name}_router.js.coffee")
        else
          template 'router.coffee', File.join(backbone_path, "routers", class_path, "#{file_name}_router.js.coffee")
        end
      end
      
      def create_view_files
        available_views.each do |view|
          if options[:pushstate]
            template "views_ps/#{view}_view.coffee", File.join(backbone_path, "views", plural_name, "#{view}_view.js.coffee")
          else
            template "views/#{view}_view.coffee", File.join(backbone_path, "views", plural_name, "#{view}_view.js.coffee")
          end
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
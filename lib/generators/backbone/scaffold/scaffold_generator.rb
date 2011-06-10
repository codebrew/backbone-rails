require 'generators/backbone/resource_helpers'

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
          template "#{view}_view.coffee", File.join(backbone_path, "views", plural_name, "#{view}_view.coffee")          
        end
      end
      
      protected
        def available_views
          %w(index show)
        end
        
    end
  end
end
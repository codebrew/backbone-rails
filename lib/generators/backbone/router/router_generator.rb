require 'generators/backbone/resource_helpers'

module Backbone
  module Generators
    class RouterGenerator < Rails::Generators::NamedBase
      include Backbone::Generators::ResourceHelpers
      
      source_root File.expand_path("../templates", __FILE__)
      desc "This generator creates a backbone router with views and templates for the provided actions"

      argument :actions, :type => :array, :default => [], :banner => "action action"
      
      RESERVED_JS_WORDS = %W{
        break case catch continue debugger default delete do else finally for 
        function if in instanceof new return switch this throw try typeof var void while with 
      }
      
      def validate_no_reserved_words
        actions.each do |action|
          if RESERVED_JS_WORDS.include? action
             raise Thor::Error, "The name '#{action}' is reserved by javascript " <<
                                "Please choose an alternative action name and run this generator again."
          end
        end
      end
      
      def create_router_files 
        template "router.#{asset_suffix}", File.join(backbone_path, "routers", class_path, "#{file_name}_router.#{asset_suffix}")
      end
      
      def create_view_files
         actions.each do |action|
           @action = action
           @view_path = File.join(backbone_path, "views", plural_name, "#{action}_view.#{asset_suffix}")
           @jst_path = File.join(backbone_path,"templates", plural_name, "#{action}.#{template_suffix}")
           
           template "view.#{asset_suffix}", @view_path
           template "template.#{template_suffix}", @jst_path
         end
      end

    end
  end
end

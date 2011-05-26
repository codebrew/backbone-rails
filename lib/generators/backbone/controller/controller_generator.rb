module Backbone
  module Generators
    class ControllerGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("../templates", __FILE__)
      desc "This generator creates a backbone controller with views and templates for the provided actions"
      
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
      
      def create_controller_files
        @controller_namespace = [application_name.capitalize, "Controllers", class_name].join(".")
        @view_namespace = [application_name.capitalize, "Views", class_name].join(".")
      
        template 'controller.coffee', File.join('app/assets/javascripts/backbone/controllers', class_path, "#{file_name}_controller.coffee")
      end
      
    end
  end
end
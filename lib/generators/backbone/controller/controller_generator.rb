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
        template 'controller.coffee', File.join('app/assets/javascripts/backbone/controllers', class_path, "#{file_name}_controller.coffee")
      end
      
      def create_view_files
         actions.each do |action|
           @action = action
           @view_path = File.join('app/assets/javascripts/backbone/views', plural_name, "#{action}_view.coffee")
           @jst_path = File.join('app/assets/javascripts/backbone/templates', plural_name, "#{action}.jst.ejs")
           
           template "view.coffee", @view_path
           template "template.jst", @jst_path
         end
      end
      
      protected
        def view_namespace
          [application_name.capitalize, "Views", class_name].join(".")
        end
        
        def controller_namespace
          [application_name.capitalize, "Controllers", class_name].join(".")
        end
        
        def jst(action)
          "backbone/templates/#{plural_name}/#{action}"
        end

    end
  end
end
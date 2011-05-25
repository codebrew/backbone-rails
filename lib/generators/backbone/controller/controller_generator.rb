module Backbone
  module Generators
    class ControllerGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("../templates", __FILE__)
      desc "This generator creates a backbone controller with views and templates for the provided actions"
      
      argument :actions, :type => :array, :default => [], :banner => "action action"
      
      def create_controller_files
        @controller_namespace = [application_name.capitalize, "Controllers", class_name].join(".")
        template 'controller.coffee', File.join('app/assets/javascripts/backbone/controllers', class_path, "#{file_name}_controller.coffee")
      end
      
    end
  end
end
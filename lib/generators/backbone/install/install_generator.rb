module Backbone
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)
  
      desc "This generator installs backbone.js with a default folder layout in app/assets/javascripts/backbone"
          
      class_option :skip_git, :type => :boolean, :aliases => "-G", :default => false,
                              :desc => "Skip Git ignores and keeps"
                                      
      def inject_backbone
        inject_into_file "app/assets/javascripts/application.js", :before => "//= require_tree" do
          "//= require underscore\n//= require backbone\n//= require backbone_rails_sync\n//= require backbone_datalink\n//= require backbone/#{application_name}\n"
        end
      end
    
      def create_dir_layout
        %W{controllers models views templates}.each do |dir|
          empty_directory "app/assets/javascripts/backbone/#{dir}" 
          create_file "app/assets/javascripts/backbone/#{dir}/.gitkeep" unless options[:skip_git]
        end
      end
    
      def create_app_file
        template "app.coffee", "app/assets/javascripts/backbone/#{application_name}.js.coffee"
      end
    
      protected
        def application_name
          if defined?(Rails) && Rails.application
            Rails.application.class.name.split('::').first.underscore
          else
            "application"
          end
        end
     
    end
  end
end
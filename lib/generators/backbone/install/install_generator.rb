module Backbone::Generators
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../templates", __FILE__)
  
    desc "This generator installs backbone.js with a default folder layout in app/assets/javascripts/backbone"
          
    def inject_backbone
      inject_into_file "app/assets/javascripts/application.js", :after => "//= require jquery_ujs" do
        "\n//= require underscore\n//= require backbone"
      end
    end
    
    def create_dir_layout
      %W{controllers models views templates}.each do |dir|          
        create_file "app/assets/javascripts/backbone/#{dir}/.gitkeep"
      end
    end
    
    def create_app_file
      template "app.coffee.erb", "app/assets/javascripts/backbone/#{application_name}.coffee"
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
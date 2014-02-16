require 'generators/backbone/resource_helpers'

module Backbone
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Backbone::Generators::ResourceHelpers

      source_root File.expand_path("../templates", __FILE__)

      desc "This generator installs backbone.js with a default folder layout in app/assets/javascripts/backbone"

      class_option :skip_git, :type => :boolean, :aliases => "-G", :default => false,
                              :desc => "Skip Git ignores and keeps"

      def inject_backbone
        # for JavaScript application.js manifest:        
        if File.exists? "#{Rails.root}/app/assets/javascripts/application.js"
          append_to_file "app/assets/javascripts/application.js" do
            "//= require underscore\n//= require backbone\n//= require backbone_rails_sync\n//= require backbone_datalink\n//= require backbone/#{application_name.underscore}\n"
          end    
        # ...or for CoffeeScript application.js.coffee manifest:
        elsif File.exists? "#{Rails.root}/app/assets/javascripts/application.js.coffee"   
          append_to_file "app/assets/javascripts/application.js.coffee" do
            "\n#= require underscore\n#= require backbone\n#= require backbone_rails_sync\n#= require backbone_datalink\n#= require backbone/#{application_name.underscore}\n"
          end
        end
      end

      def create_dir_layout
        %W{routers models views templates}.each do |dir|
          empty_directory "app/assets/javascripts/backbone/#{dir}"
          create_file "app/assets/javascripts/backbone/#{dir}/.gitkeep" unless options[:skip_git]
        end
      end

      def create_app_file
        template "app.coffee", "app/assets/javascripts/backbone/#{application_name.underscore}.js.coffee"
      end

    end
  end
end

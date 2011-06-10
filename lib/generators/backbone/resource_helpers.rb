module Backbone
  module Generators
    module ResourceHelpers
      
      def backbone_path
        "app/assets/javascripts/backbone"
      end
      
      def model_namespace
        [application_name.capitalize, "Models", class_name].join(".")
      end
      
      def collection_namespace
        [application_name.capitalize, "Collections", plural_name.capitalize].join(".")
      end
      
      def view_namespace
        [application_name.capitalize, "Views", plural_name.capitalize].join(".")
      end
      
      def controller_namespace
        [application_name.capitalize, "Controllers", plural_name.capitalize].join(".")
      end
      
      def jst(action)
        "backbone/templates/#{plural_name}/#{action}"
      end
      
    end
  end
end
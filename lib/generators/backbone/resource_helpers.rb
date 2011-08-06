module Backbone
  module Generators
    module ResourceHelpers
      
      def backbone_path
        "app/assets/javascripts/backbone"
      end
      
      def model_namespace
        [application_name.camelize, "Models", class_name].join(".")
      end
      
      def collection_namespace
        [application_name.camelize, "Collections", plural_name.camelize].join(".")
      end
      
      def view_namespace
        [application_name.camelize, "Views", plural_name.camelize].join(".")
      end
      
      def router_namespace
        [application_name.camelize, "Routers", plural_name.camelize].join(".")
      end
      
      def jst(action)
        "backbone/templates/#{plural_name}/#{action}"
      end
      
    end
  end
end
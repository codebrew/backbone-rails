module Backbone
  module Generators
    module ResourceHelpers
      
      def model_namespace
        [application_name.capitalize, "Models", class_name].join(".")
      end
      
      def collection_namespace
        [application_name.capitalize, "Collections", plural_name.capitalize].join(".")
      end
      
      def view_namespace
        [application_name.capitalize, "Views", class_name].join(".")
      end
      
      def controller_namespace
        [application_name.capitalize, "Controllers", class_name].join(".")
      end
      
    end
  end
end
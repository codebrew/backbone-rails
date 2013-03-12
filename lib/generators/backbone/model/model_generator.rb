require 'generators/backbone/resource_helpers'

module Backbone
  module Generators
    class ModelGenerator < Rails::Generators::NamedBase
      include Backbone::Generators::ResourceHelpers
        
      source_root File.expand_path("../templates", __FILE__)
      desc "This generator creates a backbone model"
      
      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"
    
      def create_backbone_model
        template "model.#{script_extension}", "#{backbone_path}/models/#{file_name}.#{script_extension}"
      end
    
    end
  end
end
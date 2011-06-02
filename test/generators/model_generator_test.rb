require 'test_helper'
require 'generators/generators_test_helper'
require "generators/backbone/model/model_generator"

class ModelGeneratorTest < Rails::Generators::TestCase
  include GeneratorsTestHelper
  tests Backbone::Generators::ModelGenerator
  
  test "simple model" do
    run_generator ["Post"]
    
    assert_file "app/assets/javascripts/backbone/models/post.coffee", do |model|
      model_class = Regexp.escape("class Dummy.Models.Post extends Backbone.Model")
      collection_class = Regexp.escape("class Dummy.Collections.PostsCollection extends Backbone.Collection")
      
      assert_match /#{model_class}/, model
      assert_match /#{collection_class}/, model
      
      assert_match /paramRoot: 'post'/, model
      assert_match /url: '\/posts'/, model
    end
    
  end
  
end
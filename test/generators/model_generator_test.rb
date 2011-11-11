require 'test_helper'
require 'generators/generators_test_helper'
require "generators/backbone/model/model_generator"

class ModelGeneratorTest < Rails::Generators::TestCase
  include GeneratorsTestHelper
  tests Backbone::Generators::ModelGenerator
  
  test "simple model" do
    run_generator %w(Post title:string content:string)
    
    assert_file "#{backbone_path}/models/post.js.coffee" do |model|
      model_class = Regexp.escape("class Dummy.Models.Post extends Backbone.Model")
      collection_class = Regexp.escape("class Dummy.Collections.PostsCollection extends Backbone.Collection")
      
      assert_match /#{model_class}/, model
      assert_match /#{collection_class}/, model
      
      assert_match /paramRoot: 'post'/, model
      assert_match /url: '\/posts'/, model
      
      assert_match /defaults:/, model
      assert_match /title: null/, model
      assert_match /content: null/, model
    end
    
  end
  
  test "two word model is camelcased" do
    run_generator %w(BlogPost title:string content:string)
    
    assert_file "#{backbone_path}/models/blog_post.js.coffee" do |model|
      model_class = Regexp.escape("class Dummy.Models.BlogPost extends Backbone.Model")
      collection_class = Regexp.escape("class Dummy.Collections.BlogPostsCollection extends Backbone.Collection")
      
      assert_match /#{model_class}/, model
      assert_match /#{collection_class}/, model
      
      assert_match /paramRoot: 'blog_post'/, model
      assert_match /url: '\/blog_posts'/, model
      
      assert_match /defaults:/, model
      assert_match /title: null/, model
      assert_match /content: null/, model
    end
    
  end
  
end
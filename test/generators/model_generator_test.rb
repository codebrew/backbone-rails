require 'test_helper'
require 'generators/generators_test_helper'
require "generators/backbone/model/model_generator"

class ModelGeneratorTest < Rails::Generators::TestCase
  include GeneratorsTestHelper
  tests Backbone::Generators::ModelGenerator
  
  test "simple model" do
    run_generator %w(Post title:string content:string)
    
    assert_file "#{backbone_path}/models/post.js.coffee", do |model|
      model_class = Regexp.escape("class Dummy.Models.Post extends Backbone.Model")

      assert_match /#{model_class}/, model
      assert_match /paramRoot: 'post'/, model
      assert_match /defaults:/, model
      assert_match /title: null/, model
      assert_match /content: null/, model
    end

    assert_file "#{backbone_path}/collections/posts_collection.js.coffee", do |collection|
      collection_class = Regexp.escape("class Dummy.Collections.PostsCollection extends Backbone.Collection")

      assert_match /#{collection_class}/, collection
      assert_match /url: '\/posts'/, collection
    end
    
  end
  
  test "two word model is camelcased" do
    run_generator %w(BlogPost title:string content:string)
    
    assert_file "#{backbone_path}/models/blog_post.js.coffee", do |model|
      model_class = Regexp.escape("class Dummy.Models.BlogPost extends Backbone.Model")

      assert_match /#{model_class}/, model
      assert_match /paramRoot: 'blog_post'/, model
      assert_match /defaults:/, model
      assert_match /title: null/, model
      assert_match /content: null/, model
    end
    
    assert_file "#{backbone_path}/collections/blog_posts_collection.js.coffee", do |collection|
      collection_class = Regexp.escape("class Dummy.Collections.BlogPostsCollection extends Backbone.Collection")

      assert_match /#{collection_class}/, collection
      assert_match /url: '\/blog_posts'/, collection
    end

  end
  
end
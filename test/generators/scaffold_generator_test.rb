require 'test_helper'
require 'generators/generators_test_helper'
require "generators/backbone/scaffold/scaffold_generator"

class ScaffoldGeneratorTest < Rails::Generators::TestCase
  include GeneratorsTestHelper
  tests Backbone::Generators::ScaffoldGenerator
  arguments %w(Post title:string content:string)
  
  test "generate controller scaffolding" do
    run_generator
    
    assert_file "#{backbone_path}/controllers/posts_controller.coffee" do |controller|
      assert_match /class Dummy.Controllers.PostsController extends Backbone.Controller/, controller
      
      %w(NewView IndexView ShowView EditView).each do |view|
        assert_match /new Dummy.Views.Posts.#{view}/, controller
      end
      
    end
  end
  
  test "generate view files" do
    run_generator
    
    assert_file "#{backbone_path}/views/posts/index_view.coffee" do |view|
      assert_match /#{Regexp.escape('JST["backbone/templates/posts/index"]')}/, view
      assert_match /#{Regexp.escape("new Dummy.Views.Posts.PostView({model : post})")}/, view
    end
    
    assert_file "#{backbone_path}/views/posts/show_view.coffee" do |view|
      assert_match /class Dummy.Views.Posts.ShowView extends Backbone.View/, view
      assert_match /#{Regexp.escape('template: JST["backbone/templates/posts/show"]')}/, view
    end
    
    assert_file "#{backbone_path}/views/posts/new_view.coffee" do |view|
      assert_match /class Dummy.Views.Posts.NewView extends Backbone.View/, view
      assert_match /#{Regexp.escape('JST["backbone/templates/posts/new"]')}/, view
    end
    
    assert_file "#{backbone_path}/views/posts/post_view.coffee" do |view|
      assert_match /class Dummy.Views.Posts.PostView extends Backbone.View/, view
      assert_match /#{Regexp.escape('JST["backbone/templates/posts/post"]')}/, view
    end
  end
  
  test "generate template files" do
    run_generator
     
    assert_file "#{backbone_path}/templates/posts/index.jst.ejs"
    assert_file "#{backbone_path}/templates/posts/new.jst.ejs"
    assert_file "#{backbone_path}/templates/posts/show.jst.ejs"
    assert_file "#{backbone_path}/templates/posts/post.jst.ejs"
   end
  
end
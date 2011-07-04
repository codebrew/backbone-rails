require 'test_helper'
require 'generators/generators_test_helper'
require "generators/backbone/scaffold/scaffold_generator"

class ScaffoldGeneratorTest < Rails::Generators::TestCase
  include GeneratorsTestHelper
  tests Backbone::Generators::ScaffoldGenerator
  arguments %w(Post title:string content:string)
  
  test "generate router scaffolding" do
    run_generator
    
    assert_file "#{backbone_path}/routers/posts_router.js.coffee" do |router|
      assert_match /class Dummy.Routers.PostsRouter extends Backbone.Router/, router
      assert_match /newPost: ->/, router
      assert_match /@posts.reset options.posts/, router
      
      %w(NewView IndexView ShowView EditView).each do |view|
        assert_match /new Dummy.Views.Posts.#{view}/, router
      end
    end
  end
  
  test "generate view files" do
    run_generator
    
    assert_file "#{backbone_path}/views/posts/index_view.js.coffee" do |view|
      assert_match /#{Regexp.escape('JST["backbone/templates/posts/index"]')}/, view
      assert_match /#{Regexp.escape('this.template(posts: this.options.posts.toJSON() ))')}/, view
      assert_match /#{Regexp.escape("new Dummy.Views.Posts.PostView({model : post})")}/, view
    end
    
    assert_file "#{backbone_path}/views/posts/show_view.js.coffee" do |view|
      assert_match /class Dummy.Views.Posts.ShowView extends Backbone.View/, view
      assert_match /#{Regexp.escape('this.template(this.options.model.toJSON() )')}/, view
      assert_match /#{Regexp.escape('template: JST["backbone/templates/posts/show"]')}/, view
    end
    
    assert_file "#{backbone_path}/views/posts/new_view.js.coffee" do |view|
      assert_match /class Dummy.Views.Posts.NewView extends Backbone.View/, view
      assert_match /#{Regexp.escape('this.template(@options.model.toJSON() )')}/, view
      assert_match /#{Regexp.escape('JST["backbone/templates/posts/new"]')}/, view
      assert_match /#{Regexp.escape('"submit #new-post": "save"')}/, view
    end
    
    assert_file "#{backbone_path}/views/posts/edit_view.js.coffee" do |view|
      assert_match /class Dummy.Views.Posts.EditView extends Backbone.View/, view
      assert_match /#{Regexp.escape('JST["backbone/templates/posts/edit"]')}/, view
      assert_match /#{Regexp.escape('"submit #edit-post": "update"')}/, view
    end
    
    assert_file "#{backbone_path}/views/posts/post_view.js.coffee" do |view|
      assert_match /class Dummy.Views.Posts.PostView extends Backbone.View/, view
      assert_match /#{Regexp.escape('this.template(this.options.model.toJSON() )')}/, view
      assert_match /#{Regexp.escape('JST["backbone/templates/posts/post"]')}/, view
    end
  end
  
  test "generate template files" do
    run_generator
     
    assert_file "#{backbone_path}/templates/posts/index.jst.ejs"
    
    assert_file "#{backbone_path}/templates/posts/new.jst.ejs" do |view|
      assert_match /#{Regexp.escape('<form id="new-post" name="post">')}/, view
    end
    
    assert_file "#{backbone_path}/templates/posts/edit.jst.ejs" do |view|
      assert_match /#{Regexp.escape('<form id="edit-post" name="post">')}/, view
    end
    
    assert_file "#{backbone_path}/templates/posts/show.jst.ejs"
    assert_file "#{backbone_path}/templates/posts/post.jst.ejs"
   end
   
  test "backbone model generator is invoked" do
    run_generator
    
    assert_file "#{backbone_path}/models/post.js.coffee" do |model|
      assert_match /url: '\/posts'/, model
      assert_match /paramRoot: 'post'/, model
      
      assert_match /title: null/, model
      assert_match /content: null/, model
    end
  end
  
end
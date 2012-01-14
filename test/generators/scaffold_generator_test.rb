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
  
  test "generate router scaffolding for model with two words" do
    run_generator %w(BlogPost title:string content:string)
    
    assert_file "#{backbone_path}/routers/blog_posts_router.js.coffee" do |router|
      assert_match /class Dummy.Routers.BlogPostsRouter extends Backbone.Router/, router
      assert_match /newBlogPost: ->/, router
      assert_match /@blogPosts.reset options.blogPosts/, router
      
      %w(NewView IndexView ShowView EditView).each do |view|
        assert_match /new Dummy.Views.BlogPosts.#{view}/, router
      end
    end
  end
  
  test "generate view files" do
    run_generator
    
    assert_file "#{backbone_path}/views/posts/index_view.js.coffee" do |view|
      assert_match /#{Regexp.escape('JST["backbone/templates/posts/index"]')}/, view
      assert_match /#{Regexp.escape('@template(posts: @options.posts.toJSON() ))')}/, view
      assert_match /#{Regexp.escape("new Dummy.Views.Posts.PostView({model : post})")}/, view
    end
    
    assert_file "#{backbone_path}/views/posts/show_view.js.coffee" do |view|
      assert_match /class Dummy.Views.Posts.ShowView extends Backbone.View/, view
      assert_match /#{Regexp.escape('@template(@model.toJSON() )')}/, view
      assert_match /#{Regexp.escape('template: JST["backbone/templates/posts/show"]')}/, view
    end
    
    assert_file "#{backbone_path}/views/posts/new_view.js.coffee" do |view|
      assert_match /class Dummy.Views.Posts.NewView extends Backbone.View/, view
      assert_match /#{Regexp.escape('@template(@model.toJSON() )')}/, view
      assert_match /#{Regexp.escape('JST["backbone/templates/posts/new"]')}/, view
      assert_match /#{Regexp.escape('"submit #new-post": "save"')}/, view
      assert_match /#{Regexp.escape('success: (post) =>')}/, view
      assert_match /#{Regexp.escape('@model = post')}/, view
    end
    
    assert_file "#{backbone_path}/views/posts/edit_view.js.coffee" do |view|
      assert_match /class Dummy.Views.Posts.EditView extends Backbone.View/, view
      assert_match /#{Regexp.escape('JST["backbone/templates/posts/edit"]')}/, view
      assert_match /#{Regexp.escape('"submit #edit-post" : "update"')}/, view
      assert_match /#{Regexp.escape('success : (post) =>')}/, view
    end
    
    assert_file "#{backbone_path}/views/posts/post_view.js.coffee" do |view|
      assert_match /class Dummy.Views.Posts.PostView extends Backbone.View/, view
      assert_match /#{Regexp.escape('@template(@model.toJSON() )')}/, view
      assert_match /#{Regexp.escape('JST["backbone/templates/posts/post"]')}/, view
    end
  end
  
  test "generate view files for model with two words" do
    run_generator %w(BlogPost title:string content:string)
    
    assert_file "#{backbone_path}/views/blog_posts/index_view.js.coffee" do |view|
      assert_match /#{Regexp.escape('JST["backbone/templates/blog_posts/index"]')}/, view
      assert_match /#{Regexp.escape('@template(blogPosts: @options.blogPosts.toJSON() ))')}/, view
      assert_match /#{Regexp.escape("new Dummy.Views.BlogPosts.BlogPostView({model : blogPost})")}/, view
    end
    
    assert_file "#{backbone_path}/views/blog_posts/show_view.js.coffee" do |view|
      assert_match /class Dummy.Views.BlogPosts.ShowView extends Backbone.View/, view
      assert_match /#{Regexp.escape('@template(@model.toJSON() )')}/, view
      assert_match /#{Regexp.escape('template: JST["backbone/templates/blog_posts/show"]')}/, view
    end
    
    assert_file "#{backbone_path}/views/blog_posts/new_view.js.coffee" do |view|
      assert_match /class Dummy.Views.BlogPosts.NewView extends Backbone.View/, view
      assert_match /#{Regexp.escape('@template(@model.toJSON() )')}/, view
      assert_match /#{Regexp.escape('JST["backbone/templates/blog_posts/new"]')}/, view
      assert_match /#{Regexp.escape('"submit #new-blog_post": "save"')}/, view
      assert_match /#{Regexp.escape('success: (blog_post) =>')}/, view
      assert_match /#{Regexp.escape('@model = blog_post')}/, view
    end
    
    assert_file "#{backbone_path}/views/blog_posts/edit_view.js.coffee" do |view|
      assert_match /class Dummy.Views.BlogPosts.EditView extends Backbone.View/, view
      assert_match /#{Regexp.escape('JST["backbone/templates/blog_posts/edit"]')}/, view
      assert_match /#{Regexp.escape('"submit #edit-blog_post" : "update"')}/, view
      assert_match /#{Regexp.escape('success : (blog_post) =>')}/, view
    end
    
    assert_file "#{backbone_path}/views/blog_posts/blog_post_view.js.coffee" do |view|
      assert_match /class Dummy.Views.BlogPosts.BlogPostView extends Backbone.View/, view
      assert_match /#{Regexp.escape('@template(@model.toJSON() )')}/, view
      assert_match /#{Regexp.escape('JST["backbone/templates/blog_posts/blog_post"]')}/, view
    end
  end
  
  test "generate template files" do
    run_generator
     
    assert_file "#{backbone_path}/templates/posts/index.jst.ejs"
    
    assert_file "#{backbone_path}/templates/posts/new.jst.ejs" do |view|
      assert_match /#{Regexp.escape('<form id="new-post" name="post">')}/, view
      assert_match /#{Regexp.escape('<input type="text" name="title" id="title" value="<%= title %>" >')}/, view
      assert_match /#{Regexp.escape('<input type="text" name="content" id="content" value="<%= content %>" >')}/, view
    end
    
    assert_file "#{backbone_path}/templates/posts/edit.jst.ejs" do |view|
      assert_match /#{Regexp.escape('<form id="edit-post" name="post">')}/, view
      assert_match /#{Regexp.escape('<input type="text" name="title" id="title" value="<%= title %>" >')}/, view
      assert_match /#{Regexp.escape('<input type="text" name="content" id="content" value="<%= content %>" >')}/, view
    end
    
    assert_file "#{backbone_path}/templates/posts/show.jst.ejs"
    assert_file "#{backbone_path}/templates/posts/post.jst.ejs"
  end
   
  test "generate template files for model with two words" do
    run_generator %w(BlogPost title:string content:string)

    assert_file "#{backbone_path}/templates/blog_posts/index.jst.ejs"

    assert_file "#{backbone_path}/templates/blog_posts/new.jst.ejs" do |view|
      assert_match /#{Regexp.escape('<form id="new-blog_post" name="blog_post">')}/, view
    end

    assert_file "#{backbone_path}/templates/blog_posts/edit.jst.ejs" do |view|
      assert_match /#{Regexp.escape('<form id="edit-blog_post" name="blog_post">')}/, view
    end

    assert_file "#{backbone_path}/templates/blog_posts/show.jst.ejs"
    assert_file "#{backbone_path}/templates/blog_posts/blog_post.jst.ejs"
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
  
  test "backbone model generator is invoked for model with two words" do
    run_generator %w(BlogPost title:string content:string)
    
    assert_file "#{backbone_path}/models/blog_post.js.coffee" do |model|
      assert_match /url: '\/blog_posts'/, model
      assert_match /paramRoot: 'blog_post'/, model
      
      assert_match /title: null/, model
      assert_match /content: null/, model
    end
  end
  
end
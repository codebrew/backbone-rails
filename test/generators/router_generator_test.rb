require 'test_helper'
require 'generators/generators_test_helper'
require "generators/backbone/router/router_generator"

class RouterGeneratorTest < Rails::Generators::TestCase
  include GeneratorsTestHelper
  tests Backbone::Generators::RouterGenerator
  
  teardown do
    BackboneRails.detect_script!
  end

  test "javascript router with two actions" do
    BackboneRails.javascript!
    run_generator ["Posts", "index", "edit"]

    assert_file "#{backbone_path}/routers/posts_router.js" do |router|
      assert_match /Dummy.Routers.PostsRouter = Backbone.Router.extend/, router
    end

    assert_file "#{backbone_path}/views/posts/index_view.js"
    assert_file "#{backbone_path}/templates/posts/index.jst.ejs"
    assert_file "#{backbone_path}/views/posts/edit_view.js"
    assert_file "#{backbone_path}/templates/posts/edit.jst.ejs"
  end

  test "javascript router with two actions via flag" do
    run_generator ["Posts", "index", "edit", "--javascript"]

    assert_file "#{backbone_path}/routers/posts_router.js" do |router|
      assert_match /Dummy.Routers.PostsRouter = Backbone.Router.extend/, router
    end

    assert_file "#{backbone_path}/views/posts/index_view.js"
    assert_file "#{backbone_path}/templates/posts/index.jst.ejs"
    assert_file "#{backbone_path}/views/posts/edit_view.js"
    assert_file "#{backbone_path}/templates/posts/edit.jst.ejs"
  end

  test "simple router with two actions" do
    run_generator ["Posts", "index", "edit"]
    
    assert_file "#{backbone_path}/routers/posts_router.js.coffee" do |router|
      assert_match /Dummy.Routers.PostsRouter extends Backbone.Router/, router
    end
    
    %W{index edit}.each do |action|
      assert_file "#{backbone_path}/views/posts/#{action}_view.js.coffee"
      assert_file "#{backbone_path}/templates/posts/#{action}.jst.ejs"
    end
  end
  
  test "camelize router names containing two words" do
    run_generator ["BlogPosts", "index", "edit"]
    
    assert_file "#{backbone_path}/routers/blog_posts_router.js.coffee" do |router|
      assert_match /Dummy.Routers.BlogPostsRouter extends Backbone.Router/, router
    end
    
    %W{index edit}.each do |action|
      assert_file "#{backbone_path}/views/blog_posts/#{action}_view.js.coffee"
      assert_file "#{backbone_path}/templates/blog_posts/#{action}.jst.ejs"
    end
  end
  
  test "raises an error when an action is a javascript reserved word" do
    content = capture(:stderr){ run_generator ["Posts", "new"] }
    assert_equal "The name 'new' is reserved by javascript Please choose an alternative action name and run this generator again.\n", content
  end
  
end
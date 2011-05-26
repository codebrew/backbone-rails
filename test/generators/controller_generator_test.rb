require 'test_helper'
require "generators/backbone/controller/controller_generator"

class ControllerGeneratorTest < Rails::Generators::TestCase    
  tests Backbone::Generators::ControllerGenerator
  destination File.expand_path("../tmp", File.dirname(__FILE__))
  setup :prepare_destination
  
  test "simple controller with two actions" do
    run_generator ["Posts", "index", "edit"]
    
    assert_file "app/assets/javascripts/backbone/controllers/posts_controller.coffee"
    
    %W{index edit}.each do |action|  
      assert_file "app/assets/javascripts/backbone/views/posts/#{action}_view.coffee"
      assert_file "app/assets/javascripts/backbone/templates/posts/#{action}.jst.ejs"
    end
  end
  
  test "raises an error when an action is a javascript reserved word" do
    content = capture(:stderr){ run_generator ["Posts", "new"] }
    assert_equal "The name 'new' is reserved by javascript Please choose an alternative action name and run this generator again.\n", content
  end
  
end
require 'test_helper'

class BackboneRailsTest < ActiveSupport::TestCase
  test "backbone.js is found as an asset" do
    assert_not_nil Dummy::Application.assets["backbone"]
  end
  
  test "underscore.js is found as an asset" do
    assert_not_nil Dummy::Application.assets["underscore"]
  end
end

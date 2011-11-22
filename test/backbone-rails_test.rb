require 'test_helper'

class BackboneRailsTest < ActiveSupport::TestCase
  def setup
    @app = Dummy::Application
  end

  test "backbone.js is found as an asset" do
    assert_not_nil @app.assets["backbone"]
  end

  test "underscore.js is found as an asset" do
    assert_not_nil @app.assets["underscore"]
  end
end

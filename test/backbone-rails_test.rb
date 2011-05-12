require 'test_helper'

require 'backbone-rails/underscore_template'

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
  
  test "jst extension is registered" do
    assert @app.assets.engines.extensions.include?(".jst")
  end
  
  test "jst extension is registered to UnderscoreTemplate" do
    assert_equal Tilt::UnderscoreTemplate, @app.assets.engines[".jst"]
  end
end

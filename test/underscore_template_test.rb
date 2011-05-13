require 'test_helper'
require 'backbone-rails/tilt/underscore_template'

class UnderscoreTemplateTest < Test::Unit::TestCase
  FIXTURE_ROOT = File.expand_path(File.join(File.dirname(__FILE__), "fixtures"))
  
  def fixture(path)
    IO.read(fixture_path(path))
  end

  def fixture_path(path)
    File.join(FIXTURE_ROOT, path)
  end
  
  def template_for(path)
    Tilt::UnderscoreTemplate.new(fixture_path(path))
  end
  
  def test_render_simple_jst
    compiled = template_for("hello.js.jst").evaluate(nil, nil)

    assert_equal "(function(){\nthis.JST = this.JST || {};\nthis.JST['hello'] = _.template(\"Hello <%= name %>\");\n}).call(this);", compiled
  end
end
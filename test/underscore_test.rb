require 'test_helper'
require 'backbone-rails/underscore'

class UnderscoreTest < ActiveSupport::TestCase
  
  test "render simple template" do
    result = Underscore.render("hello", "hello <%= name %>")
    assert_equal "(function(){\nthis.JST = this.JST || {};\nthis.JST['hello'] = _.template(\"hello <%= name %>\");\n}).call(this);", result
  end
  
end
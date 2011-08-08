require 'test_helper'
require 'generators/generators_test_helper'
require "generators/backbone/install/install_generator"

module Backbone
  module Generators
    class InstallGenerator < Rails::Generators::Base
      protected
        def application_name
          "FooBar"
        end
    end
  end
end

class InstallGeneratorTest < Rails::Generators::TestCase
  include GeneratorsTestHelper
  tests Backbone::Generators::InstallGenerator

  def setup
    mkdir_p "#{destination_root}/app/assets/javascripts"
    cp fixture("application.js"), "#{destination_root}/app/assets/javascripts"

    super
  end

  test "Assert application coffeescript file is created" do
    run_generator

    assert_file "#{backbone_path}/foo_bar.js.coffee", /window\.FooBar/
  end

  test "Assert backbone directory structure is created" do
    run_generator

    %W{routers models views templates}.each do |dir|
      assert_directory "#{backbone_path}/#{dir}"
      assert_file "#{backbone_path}/#{dir}/.gitkeep"
    end
  end

  test "Assert no gitkeep files are created when skipping git" do
    run_generator [destination_root, "--skip-git"]

    %W{routers models views templates}.each do |dir|
      assert_directory "#{backbone_path}/#{dir}"
      assert_no_file "#{backbone_path}/#{dir}/.gitkeep"
    end
  end

  test "Assert application.js require underscore, backbone and backbone_rails_sync" do
    run_generator

    assert_file "app/assets/javascripts/application.js" do |application|
      %W{underscore backbone backbone_rails_sync backbone_datalink foo_bar}.each do |require|
        assert_match /#{require}/, application
      end
    end
  end

  def fixture(file)
    File.expand_path("fixtures/#{file}", File.dirname(__FILE__))
  end

end

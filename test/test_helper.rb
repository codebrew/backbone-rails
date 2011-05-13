# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

FIXTURE_ROOT = File.expand_path(File.join(File.dirname(__FILE__), "fixtures"))

def fixture(path)
  IO.read(fixture_path(path))
end
  
def fixture_path(path)
  File.join(FIXTURE_ROOT, path)
end

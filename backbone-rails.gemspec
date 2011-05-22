# Provide a simple gemspec so you can easily use your
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "backbone-rails"
  s.authors     = ["Ryan Fitzgerald", "Code Brew Studios"]
  s.email       = ["ryan@codebrewstudios.com"]
  s.homepage    = "http://rubygems.org/gems/backbone-rails"
  
  s.summary = "Use backbone.js with rails 3.1"
  s.description = "quickly setup backbone.js for use with rails 3.1"
  s.files = Dir["lib/**/*"] + Dir["vendor/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.version = "0.0.1"
  
  s.add_development_dependency "bundler", "~> 1.0.0"
  s.add_development_dependency "railties",   "~> 3.1"
  
  s.require_paths = ['lib']
end

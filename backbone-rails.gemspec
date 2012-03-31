# Provide a simple gemspec so you can easily use your
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "rails-backbone"
  s.version = "0.7.1"
  s.authors     = ["Ryan Fitzgerald", "Code Brew Studios"]
  s.email       = ["ryan@codebrewstudios.com"]
  s.homepage    = "http://github.com/codebrew/backbone-rails"
  
  s.summary = "Use backbone.js with rails 3.1"
  s.description = "Quickly setup backbone.js for use with rails 3.1. Generators are provided to quickly get started."
  s.files = Dir["lib/**/*"] + Dir["vendor/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  
  s.add_dependency('railties', '>= 3.1.0')
  s.add_dependency('coffee-script', '~> 2.2.0')
  s.add_dependency('ejs', '~> 1.0.0')
  
  s.require_paths = ['lib']
end

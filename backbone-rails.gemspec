# Provide a simple gemspec so you can easily use your
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "rails-backbone"
  s.version = "0.9.10"
  s.authors     = ["Ryan Fitzgerald", "Code Brew Studios"]
  s.email       = ["ryan@codebrewstudios.com"]
  s.homepage    = "http://github.com/codebrew/backbone-rails"
  
  s.summary = "Use backbone.js with rails 3.1"
  s.description = "Quickly setup backbone.js for use with rails 3.1. Generators are provided to quickly get started."
  s.files = Dir["lib/**/*"] + Dir["vendor/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  
  s.add_dependency('railties', '>= 3.1.0')
  s.add_dependency('coffee-script', '~> 2.2.0')
  s.add_dependency('jquery-rails', '~> 2.1.3')
  s.add_dependency('ejs', '~> 1.1.1')

  s.add_development_dependency('rails', '~> 3.2.0')
  s.add_development_dependency('sqlite3')
  s.add_development_dependency('sass')
  s.add_development_dependency('uglifier')
  s.add_development_dependency('mocha', '~> 0.10.3')
  s.add_development_dependency('turn', '~> 0.8.3')
  s.add_development_dependency('minitest', '~> 2.10.1')
  
  s.require_paths = ['lib']
end

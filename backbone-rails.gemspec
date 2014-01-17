# Provide a simple gemspec so you can easily use your
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "rails-backbone"
  s.version = "1.1.0"
  s.authors     = ["Ryan Fitzgerald", "Code Brew Studios, Manu S Ajith"]
  s.email       = ["ryan@codebrewstudios.com, neo@codingarena.in"]
  s.homepage    = "http://github.com/codebrew/backbone-rails"
  
  s.summary = "Use backbone.js with rails 3.1 and above apps"
  s.description = "Quickly setup backbone.js for use with rails 3.1 and above apps. Generators are provided to quickly get started."
  s.files = Dir["lib/**/*"] + Dir["vendor/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  
  s.add_dependency('railties')
  s.add_dependency('coffee-script')
  s.add_dependency('jquery-rails')
  s.add_dependency('ejs')

  s.add_development_dependency('rails')
  s.add_development_dependency('sqlite3')
  s.add_development_dependency('sass')
  s.add_development_dependency('uglifier')
  s.add_development_dependency('turn')
  s.add_development_dependency('minitest')
  
  s.require_paths = ['lib']
end

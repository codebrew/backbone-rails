# Backbone-Rails

Easily setup and use backbone.js with rails 3.1

## Rails 3.1 setup
This gem requires the use of rails 3.1, coffeescript and the new rails asset pipeline provided by sprockets.

This gem vendors the latest version of underscore.js and backbones.js for Rails 3.1 and greater. The files will be added to the asset pipeline and available for you to use. 
    
### Installation

In your Gemfile, add this line:

    gem "backbone-rails"
  
Then run the following commands:

    bundle install
    rails g backbone:install
    
## Generators
backbone-rails provides 3 simple generators to help get you started using bacbone.js with rails 3.1

### Model Generator

    rails g backbone:model
    
This generator creates a backbone model and collection inside `app/assets/javascript/backbone/models` to be used to talk to the rails backend.

### Controller
    
    rails g backbone:controller
    
This generator creates a backbone controller with corresponding views and templates for the given actions provided.

### Scaffolding

    rails g backbone:scaffold
    
This generator creates a controller, views, templates, model and collection to create a simple crud single page app
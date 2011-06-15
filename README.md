# Backbone-Rails

Easily setup and use backbone.js with rails 3.1

## Rails 3.1 setup
This gem requires the use of rails 3.1 and the use of sprockets for asset packaging.

This gem vendors the latest version of underscore.js and backbones.js for Rails 3.1 and greater. The files will be added to the asset pipeline and available for you to use. 
    
### Installation

In your Gemfile, add this line:

    gem "backbone-rails"
  
Then run the following commands:

    bundle install
    rails g backbone:install
# Backbone-Rails

Easily setup and use backbone.js with rails 3.1

## Rails 3.1 setup
This gem requires the use of rails 3.1 and the use of sprockets for asset packaging.

This gem vendors the latest version of underscore.js and backbones.js for Rails 3.1 and greater. The files will be added to the asset pipeline and available for you to use. 
You need to add the following two lines to the file `app/assets/javascripts/application.js`:

    //= require underscore
    //= require backbone
    
### Installation

In your Gemfile, add this line:

  gem "backbone-rails"
  
Then run `bundle install`. You're done!

## JavaScript Templates

This gem provides the ability to compile javascript templates using [underscore templates](http://documentcloud.github.com/underscore/#template)
and makes them available on the client on a global JST object.

Any file with the extension '.js.jst' will get compiled using [underscore templates](http://documentcloud.github.com/underscore/#template)

example `app/assets/javascripts/hello.js.jst`:
  
    hello <%= name %>
  
will be compiled and available on the client as JST.hello
  
    JST.hello({name: "Tammy"});
  
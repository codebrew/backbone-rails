# Backbone-Rails [![Build Status](https://secure.travis-ci.org/codebrew/backbone-rails.png)](http://travis-ci.org/codebrew/backbone-rails)[![Gem Version](https://badge.fury.io/rb/rails-backbone.png)](http://badge.fury.io/rb/rails-backbone)

Easily setup and use backbone.js (1.2.0) with Rails 3.1 and greater

##Version##

###Github master branch###

Gem version : 1.2.0

Backbone version : 1.2.0

Underscore version : 1.8.3

###Rubygems###

Gem version : 1.2.0

Backbone version : 1.2.0

Underscore version : 1.8.3


##Credits##
###Author###
[Ryan Fitzgerald](http://twitter.com/#!/TheRyanFitz)
###Current Maintainer
[Manu S Ajith](http://twitter.com/manusajith)
###Contributors###
These [awesome people](https://github.com/codebrew/backbone-rails/graphs/contributors) helped to keep this gem updated

## Rails setup
This gem requires the use of rails 3.1 and greater, coffeescript and the new rails asset pipeline provided by sprockets.

This gem vendors the latest version of underscore.js and backbone.js for Rails 3.1 and greater. The files will be added to the asset pipeline and available for you to use.

### Installation

In your Gemfile, add this line:

    gem "rails-backbone"

Then run the following commands:

    bundle install
    rails g backbone:install

### Layout and namespacing

Running `rails g backbone:install` will create the following directory structure under `app/assets/javascripts/backbone`:

    routers/
    models/
    templates/
    views/

It will also create a toplevel app_name.coffee file to setup namespacing and setup initial requires.

## Generators
backbone-rails provides 3 simple generators to help get you started using backbone.js with rails 3.1 and greater.
The generators will only create client side code (javascript).

### Model Generator

    rails g backbone:model model_name [property_name:property_type[,]]

This generator creates a backbone model and collection inside `app/assets/javascript/backbone/models` to be used to talk to the rails backend.

### Routers

    rails g backbone:router model_name [action_name[,]]

This generator creates a backbone router with corresponding views and templates for the given actions provided.

### Scaffolding

    rails g backbone:scaffold model_name [property_name:property_type[,]]

This generator creates a router, views, templates, model and collection to create a simple crud single page app

## Example Usage

Created a new rails application called `blog`.

    rails new blog

Edit your Gemfile and add

    gem 'rails-backbone'

Install the gem and generate scaffolding.

    bundle install
    rails g backbone:install
    rails g scaffold Post title:string content:string
    rake db:migrate
    rails g backbone:scaffold Post title:string content:string

You now have installed the backbone-rails gem, setup a default directory structure for your frontend backbone code.
Then you generated the usual rails server side crud scaffolding and finally generated backbone.js code to provide a simple single page crud app.
You have one last step:

Edit your posts index view `app/views/posts/index.html.erb` with the following contents:

    <div id="posts"></div>

    <script type="text/javascript">
      $(function() {
        // Blog is the app name
        window.router = new Blog.Routers.PostsRouter({posts: <%= @posts.to_json.html_safe -%>});
        Backbone.history.start();
      });
    </script>

If you prefer haml, this is equivalent to inserting the following code into `app/views/posts/index.html.haml`:

    #posts

    :javascript
      $(function() {
        // Blog is the app name
        window.router = new Blog.Routers.PostsRouter({posts: #{@posts.to_json.html_safe}});
        Backbone.history.start();
      });


Now start your server `rails s` and browse to [localhost:3000/posts](http://localhost:3000/posts)
You should now have a fully functioning single page crud app for Post models.

Sample application can be found [here](https://github.com/manusajith/backbone-rails-demo)

##Note:##
####Overrides backbone sync function####
This gem overrides the backbone sync function. Check [here](https://github.com/codebrew/backbone-rails/blob/master/vendor/assets/javascripts/backbone_rails_sync.js) for details.

####With Rails 4:####
If you are using the default Rails 4 scaffold generators, you will need to adjust the default JSON show view (IE, 'show.json') to render the 'id' attribute.

default rails generated show.json.jbuilder

`json.extract! @post, :title, :content, :created_at, :updated_at`

Change it to add `id` attribute as well

`json.extract! @post, :id, :title, :content, :created_at, :updated_at`

Without adjusting the JSON show view, you will be redirected to a "undefined" url after creating an object.

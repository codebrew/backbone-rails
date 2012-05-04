# Backbone-Rails [![Build Status](https://secure.travis-ci.org/codebrew/backbone-rails.png)](http://travis-ci.org/codebrew/backbone-rails)

Easily setup and use backbone.js (0.9.2) with rails 3.1 and greater

Follow [@TheRyanFitz on Twitter](http://twitter.com/#!/TheRyanFitz). Tweet any questions or suggestions you have about the project.

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

    rails g backbone:model
    
This generator creates a backbone model and collection inside `app/assets/javascript/backbone/models` to be used to talk to the rails backend.

### Routers
    
    rails g backbone:router
    
This generator creates a backbone router with corresponding views and templates for the given actions provided.

### Scaffolding

    rails g backbone:scaffold
    
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

    :javascript
      $(function() {
        // Blog is the app name
        window.router = new Blog.Routers.PostsRouter({posts: #{@posts.to_json.html_safe}});
        Backbone.history.start();
      });

Now start your server `rails s` and browse to [localhost:3000/posts](http://localhost:3000/posts)
You should now have a fully functioning single page crud app for Post models.

### Using pushState

In order to make the scaffold compliant with pushState just add `--pushstate` at the end of the command, like so:

    rails g backbone:scaffold Post title:string content:string --pushstate

Take in consideration that the backbone history must be told to use push state:

    Backbone.history.start({pushState: true, root: "/posts"});

You must also edit the controller at `app/controllers/posts_controller.rb` so that the `create` and `update` actions remove the `id`, `created_at` and `updated_at` values from the params hash, since they are handled by the server. You can do that by adding this line on the top of each action:

    params[:post] = params[:post].except(:id, :created_at, :updated_at) if request.format == "application/json"

>Note that using real URLs requires your web server to be able to correctly render those pages, so back-end changes are required as well. For example, if you have a route of <code>/documents/100</code>, your web server must be able to serve that page, if the browser visits that URL directly.
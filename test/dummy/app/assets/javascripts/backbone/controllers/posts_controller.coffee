class Dummy.Controllers.PostsController extends Backbone.Controller
  initialize: (options) ->
    @posts = new Dummy.Collections.PostsCollection()
    @posts.refresh options.posts

  routes:
    "/new": "newPost"
    "/index": "index"
    "/:id/edit": "edit"
    "/:id": "show"
    ".*": "index"

  newProject: ->
    @view = new Dummy.Views.Posts.NewView(model: new @posts.model())
    $("#posts").html(@view.render().el)

  index: ->
    @view = new Dummy.Views.Posts.IndexView(posts: @posts)
    $("#posts").html(@view.render().el)

  show: (id) ->
    post = @posts.get(id)
    
    @view = new Dummy.Views.Posts.ShowView(model: post)
    $("#posts").html(@view.render().el)
    
  edit: (id) ->
    post = @posts.get(id)

    @view = new Dummy.Views.Posts.EditView(model: post)
    $("#posts").html(@view.render().el)
  
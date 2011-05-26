class Dummy.Controllers.PostsController extends Backbone.Controller
  initialize: (options) ->
    
  routes:
    "/index": "index"
    
  index: ->
    @view = new Dummy.Views.Posts.IndexView()
    $("#posts").html(@view.render().el)
    

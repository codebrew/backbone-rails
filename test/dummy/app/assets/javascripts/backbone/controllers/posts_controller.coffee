class Dummy.Controllers.PostsController extends Backbone.Controller
  initialize: (options) ->
    
  routes:
    "/index": "index"
    "/edit": "edit"
    
  index: ->
    @view = new Dummy.Views.Posts.IndexView()
    $("#posts").html(@view.render().el)
    
  edit: ->
    @view = new Dummy.Views.Posts.EditView()
    $("#posts").html(@view.render().el)
    

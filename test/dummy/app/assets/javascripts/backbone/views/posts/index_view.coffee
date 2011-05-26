Dummy.Views.Posts ||= {}

class Dummy.Views.Posts.IndexView extends Backbone.View
  template: JST["backbone/templates/posts/index"]
       
  render: ->
    $(@el).html(@template())
    return this
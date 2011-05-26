Dummy.Views.Posts ||= {}

class Dummy.Views.Posts.EditView extends Backbone.View
  template: JST["posts/edit"]
       
  render: ->
    $(@el).html(@template())
    return this
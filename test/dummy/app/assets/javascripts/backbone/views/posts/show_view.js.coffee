Dummy.Views.Posts ||= {}

class Dummy.Views.Posts.ShowView extends Backbone.View
  template: JST["backbone/templates/posts/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this

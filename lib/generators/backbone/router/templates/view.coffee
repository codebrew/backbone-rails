<%= view_namespace %> ||= {}

class <%= view_namespace %>.<%= @action.camelize %>View extends Backbone.View
  template: JST["<%= jst @action %>"]

  render: ->
    $(@el).html(@template())
    return this

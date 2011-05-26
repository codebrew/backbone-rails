<%= view_namespace %> ||= {}

class <%= view_namespace %>.<%= @action.capitalize %>View extends Backbone.View
  template: JST["<%= template_name @action %>"]
       
  render: ->
    $(@el).html(@template())
    return this
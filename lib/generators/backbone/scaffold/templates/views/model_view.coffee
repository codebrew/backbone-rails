<%= view_namespace %> ||= {}

class <%= view_namespace %>.<%= singular_name.camelize %>View extends Backbone.View
  template: JST["<%= jst singular_name %>"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this

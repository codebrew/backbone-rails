<%= view_namespace %> ||= {}

class <%= view_namespace %>.EditView extends Backbone.View
  template : JST["<%= jst 'edit' %>"]

  events :
    "submit #edit-<%= singular_name %>" : "update"

  update : (e) ->
    @model.save(null,
      success : (<%= singular_name %>) =>
        @model = <%= singular_name %>
        window.location.hash = "/#{@model.id}"
    )

    return false

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this

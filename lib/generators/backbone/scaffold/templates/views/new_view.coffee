<%= view_namespace %> ||= {}

class <%= view_namespace %>.NewView extends Backbone.View
  template: JST["<%= jst 'new' %>"]

  events:
    "submit #new-<%= singular_name %>": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (<%= singular_name %>) =>
        @model = <%= singular_name %>
        window.location.hash = "/#{@model.id}"

      error: (<%= singular_name %>, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this

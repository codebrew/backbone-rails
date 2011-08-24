class <%= router_namespace %>Router extends Backbone.Router
  initialize: (options) ->
    @<%= underscored_plural_model_name %> = new <%= collection_namespace %>Collection()
    @<%= underscored_plural_model_name %>.reset options.<%= underscored_plural_model_name %>

  routes:
    "/new": "new<%= class_name %>"
    "/index": "index"
    "/:id/edit": "edit"
    "/:id": "show"
    ".*": "index"

  new<%= class_name %>: ->
    @view = new <%= "#{view_namespace}.NewView(collection: @#{underscored_plural_model_name})" %>
    $("#<%= plural_name %>").html(@view.render().el)

  index: ->
    @view = new <%= "#{view_namespace}.IndexView(#{plural_name}: @#{underscored_plural_model_name})" %>
    $("#<%= plural_name %>").html(@view.render().el)

  show: (id) ->
    <%= singular_name %> = @<%= underscored_plural_model_name %>.get(id)

    @view = new <%= "#{view_namespace}.ShowView(model: #{singular_name})" %>
    $("#<%= plural_name %>").html(@view.render().el)

  edit: (id) ->
    <%= singular_name %> = @<%= underscored_plural_model_name %>.get(id)

    @view = new <%= "#{view_namespace}.EditView(model: #{singular_name})" %>
    $("#<%= plural_name %>").html(@view.render().el)

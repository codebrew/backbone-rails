class <%= controller_namespace %>Controller extends Backbone.Controller
  initialize: (options) ->
    @<%= plural_name %> = new <%= collection_namespace %>Collection()
    @<%= plural_name %>.refresh options.<%= plural_name %>

  routes:
    "/new": "new<%= class_name %>"
    "/index": "index"
    "/:id/edit": "edit"
    "/:id": "show"
    ".*": "index"

  new<%= class_name %>: ->
    @view = new <%= "#{view_namespace}.NewView(collection: @#{plural_name})" %>
    $("#<%= plural_name %>").html(@view.render().el)

  index: ->
    @view = new <%= "#{view_namespace}.IndexView(#{plural_name}: @#{plural_name})" %>
    $("#<%= plural_name %>").html(@view.render().el)

  show: (id) ->
    <%= singular_name %> = @<%= plural_name %>.get(id)
    
    @view = new <%= "#{view_namespace}.ShowView(model: #{singular_name})" %>
    $("#<%= plural_name %>").html(@view.render().el)
    
  edit: (id) ->
    <%= singular_name %> = @<%= plural_name %>.get(id)

    @view = new <%= "#{view_namespace}.EditView(model: #{singular_name})" %>
    $("#<%= plural_name %>").html(@view.render().el)
  
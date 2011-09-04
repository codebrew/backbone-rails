class <%= router_namespace %>Router extends Backbone.Router
  initialize: (options) ->

  routes:
  <% actions.each do |action| -%>
  "/<%= action %>": "<%= action %>"
  <% end -%>

<% actions.each do |action| -%>
  <%= action %>: ->
    @view = new <%= "#{view_namespace}.#{action.camelize}View()" %>
    $("#<%= plural_name %>").html(@view.render().el)

<% end -%>

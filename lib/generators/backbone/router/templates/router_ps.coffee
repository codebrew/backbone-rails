class <%= router_namespace %>Router extends Backbone.Router
  initialize: (options) ->
    @el = $("#<%= plural_name %>")

  routes:
  <% actions.each do |action| -%>
  "/<%= action %>": "<%= action %>"
  <% end -%>

<% actions.each do |action| -%>
  <%= action %>: ->
    @view = new <%= "#{view_namespace}.#{action.camelize}View()" %>
    @el.html(@view.render().el)

<% end -%>

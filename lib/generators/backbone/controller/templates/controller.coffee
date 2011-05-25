class <%= @controller_namespace %>Controller extends Backbone.Controller
  initialize: (options) ->
    
  routes:
  <% actions.each do |action| -%>
  "/<%= action %>": "<%= action %>"
  <% end -%>
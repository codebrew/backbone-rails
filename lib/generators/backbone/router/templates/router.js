<%= router_namespace %>Router = Backbone.Router.extend({
  initialize: function(options) {

  },

  routes: {
  <% actions.each do |action| -%>
  "<%= action %>": "<%= action %>",
  <% end -%>
  },

<% actions.each do |action| -%>
  <%= action %>: function() {
    this.view = new <%= "#{view_namespace}.#{action.camelize}View()" %>;
    $("#<%= plural_name %>").html(this.view.render().el);
  },

<% end -%>
});

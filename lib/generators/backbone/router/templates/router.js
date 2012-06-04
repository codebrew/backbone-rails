(function() {

  <%= router_namespace %>Router = Backbone.Router.extend({

    initialize: function(options) {},

    routes: {
    <% actions.each_with_index do |action,i| -%>
      "<%= action %>": "<%= action %>"<%= i < action.size - 1 ? "," : "" %>
    <% end -%>
    },

  <% actions.each_with_index do |action,i| -%>
    <%= action %>: function() {
      this.view = new <%= "#{view_namespace}.#{action.camelize}View()" %>;
      $("#<%= plural_name %>").html(this.view.render().el);
    }<%= i < action.size - 1 ? "," : "" %>
  <% end -%>

  });

}).call(this);

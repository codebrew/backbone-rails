<%= router_namespace %>Router = Backbone.Router.extend({
  initialize: function(options) {
    this.<%= plural_model_name %> = new <%= collection_namespace %>Collection();
    this.<%= plural_model_name %>.reset(options.<%= plural_model_name %>);
  },

  routes: {
    "new"      : "new<%= class_name %>",
    "index"    : "index",
    ":id/edit" : "edit",
    ":id"      : "show",
    ".*"       : "index"
  },

  new<%= class_name %>: function() {
    this.view = new <%= view_namespace %>.NewView({collection: this.<%= plural_name %>});
    $("#<%= plural_name %>").html(this.view.render().el);
  },

  index: function() {
    this.view = new <%= view_namespace %>.IndexView({<%= plural_name %>: this.<%= plural_name %>});
    $("#<%= plural_name %>").html(this.view.render().el);
  },

  show: function(id) {
    var <%= singular_name %> = this.<%= plural_name %>.get(id);

    this.view = new <%= view_namespace %>.ShowView({model: <%= singular_name %>});
    $("#<%= plural_name %>").html(this.view.render().el);
  },

  edit: function(id) {
    var <%= singular_name %> = this.<%= plural_name %>.get(id);

    this.view = new <%= view_namespace %>.EditView({model: <%= singular_name %>});
    $("#<%= plural_name %>").html(this.view.render().el);
  }
});

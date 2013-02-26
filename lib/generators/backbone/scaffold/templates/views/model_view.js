<%= view_namespace %> || (<%= view_namespace %> = {});

<%= view_namespace %>.<%= singular_name.camelize %>View = Backbone.View.extend({
  template: JST["<%= jst singular_name %>"],

  events: {
    "click .destroy" : "destroy"
  },

  tagName: "tr",

  destroy: function() {
    this.model.destroy();
    this.remove();

    return false;
  },

  render: function() {
    this.$el.html(this.template(this.model.toJSON() ));
    return this;
  }
});

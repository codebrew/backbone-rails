<%= view_namespace %> || (<%= view_namespace %> = {});

<%= view_namespace %>.<%= @action.camelize %>View = Backbone.View.extend({
  template: JST["<%= jst @action %>"],

  render: function() {
    this.$el.html(this.template());
    return this;
  }
});

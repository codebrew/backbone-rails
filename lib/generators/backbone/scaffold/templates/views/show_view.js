<%= view_namespace %> || (<%= view_namespace %> = {});

<%= view_namespace %>.ShowView = Backbone.View.extend({
  template: JST["<%= jst 'show' %>"],

  render: function() {
    this.$el.html(this.template(this.model.toJSON() ));
    return this;
  }
});

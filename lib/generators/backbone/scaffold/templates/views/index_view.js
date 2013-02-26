<%= view_namespace %> || (<%= view_namespace %> = {});

<%= view_namespace %>.IndexView = Backbone.View.extend({
  template: JST["<%= jst 'index' %>"],

  initialize: function() {
    this.addAll = _.bind(this.addAll, this);
    this.addOne = _.bind(this.addOne, this);
    this.render = _.bind(this.render, this);
    this.options.<%= plural_model_name %>.bind('reset', this.addAll);
  },

  addAll: function() {
    this.options.<%= plural_model_name %>.each(this.addOne);
  },

  addOne: function(<%= singular_model_name %>) {
    view = new <%= view_namespace %>.<%= singular_name.camelize %>View({model : <%= singular_model_name %>});
    this.$("tbody").append(view.render().el);
  },

  render: function() {
    this.$el.html(this.template({<%= plural_model_name %>: this.options.<%= plural_model_name %>.toJSON() }));
    this.addAll();

    return this;
  }
});

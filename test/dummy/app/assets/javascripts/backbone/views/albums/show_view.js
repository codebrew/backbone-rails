Dummy.Views.Albums || (Dummy.Views.Albums = {});

Dummy.Views.Albums.ShowView = Backbone.View.extend({
  template: JST["backbone/templates/albums/show"],

  render: function() {
    this.$el.html(this.template(this.model.toJSON() ));
    return this;
  }
});

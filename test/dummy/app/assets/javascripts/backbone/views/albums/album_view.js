Dummy.Views.Albums || (Dummy.Views.Albums = {});

Dummy.Views.Albums.AlbumView = Backbone.View.extend({
  template: JST["backbone/templates/albums/album"],

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

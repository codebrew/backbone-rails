Dummy.Views.Albums || (Dummy.Views.Albums = {});

Dummy.Views.Albums.IndexView = Backbone.View.extend({
  template: JST["backbone/templates/albums/index"],

  initialize: function() {
    this.addAll = _.bind(this.addAll, this);
    this.addOne = _.bind(this.addOne, this);
    this.render = _.bind(this.render, this);
    this.options.albums.bind('reset', this.addAll);
  },

  addAll: function() {
    this.options.albums.each(this.addOne);
  },

  addOne: function(album) {
    view = new Dummy.Views.Albums.AlbumView({model : album});
    this.$("tbody").append(view.render().el);
  },

  render: function() {
    this.$el.html(this.template({albums: this.options.albums.toJSON() }));
    this.addAll();

    return this;
  }
});

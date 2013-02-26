Dummy.Routers.AlbumsRouter = Backbone.Router.extend({
  initialize: function(options) {
    this.albums = new Dummy.Collections.AlbumsCollection();
    this.albums.reset(options.albums);
  },

  routes: {
    "new"      : "newAlbum",
    "index"    : "index",
    ":id/edit" : "edit",
    ":id"      : "show",
    ".*"       : "index"
  },

  newAlbum: function() {
    this.view = new Dummy.Views.Albums.NewView({collection: this.albums});
    $("#albums").html(this.view.render().el);
  },

  index: function() {
    this.view = new Dummy.Views.Albums.IndexView({albums: this.albums});
    $("#albums").html(this.view.render().el);
  },

  show: function(id) {
    var album = this.albums.get(id);

    this.view = new Dummy.Views.Albums.ShowView({model: album});
    $("#albums").html(this.view.render().el);
  },

  edit: function(id) {
    var album = this.albums.get(id);

    this.view = new Dummy.Views.Albums.EditView({model: album});
    $("#albums").html(this.view.render().el);
  }
});

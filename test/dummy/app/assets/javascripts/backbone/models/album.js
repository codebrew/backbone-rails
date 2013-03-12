Dummy.Models.Album = Backbone.Model.extend({
  paramRoot: 'album',

  defaults: {
    title: null,
    artist: null
  }
});

Dummy.Collections.AlbumsCollection = Backbone.Collection.extend({
  model: Dummy.Models.Album,
  url: '/albums'
});

Dummy.Views.Albums || (Dummy.Views.Albums = {});

Dummy.Views.Albums.NewView = Backbone.View.extend({
  template: JST["backbone/templates/albums/new"],

  events: {
    "submit #new-album": "save"
  },

  initialize: function() {
    var self = this;
    this.model = new this.collection.model();

    this.model.bind("change:errors", function() {
      self.render();
    });
  },

  save: function(e) {
    e.preventDefault();
    e.stopPropagation();

    this.model.unset("errors");

    var self = this;
    this.collection.create(this.model.toJSON(), {
      success: function(album) {
        self.model = album;
        window.location.hash = "/" + self.model.id;
      },

      error: function(album, jqXHR) {
        self.model.set({errors: $.parseJSON(jqXHR.responseText)});
      }
    });
  },

  render: function() {
    this.$el.html(this.template(this.model.toJSON() ));

    this.$("form").backboneLink(this.model);

    return this;
  }
});

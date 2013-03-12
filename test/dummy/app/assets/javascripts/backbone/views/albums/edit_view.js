Dummy.Views.Albums || (Dummy.Views.Albums = {});

Dummy.Views.Albums.EditView = Backbone.View.extend({
  template: JST["backbone/templates/albums/edit"],

  events: {
    "submit #edit-album": "update"
  },

  update: function(e) {
    var self = this;
    e.preventDefault();
    e.stopPropagation();

    this.model.save(null, {
      success: function(album) {
        self.model = album;
        window.location.hash = "/" + self.model.id;
      }
    });
  },

  render: function() {
    this.$el.html(this.template(this.model.toJSON() ));

    this.$("form").backboneLink(this.model);

    return this;
  }
});

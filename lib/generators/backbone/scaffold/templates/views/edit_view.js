<%= view_namespace %> || (<%= view_namespace %> = {});

<%= view_namespace %>.EditView = Backbone.View.extend({
  template: JST["<%= jst 'edit' %>"],

  events: {
    "submit #edit-<%= singular_name %>": "update"
  },

  update: function(e) {
    var self = this;
    e.preventDefault();
    e.stopPropagation();

    this.model.save(null, {
      success: function(<%= singular_name %>) {
        self.model = <%= singular_name %>;
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

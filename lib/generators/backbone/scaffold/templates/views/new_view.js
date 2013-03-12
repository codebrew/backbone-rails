<%= view_namespace %> || (<%= view_namespace %> = {});

<%= view_namespace %>.NewView = Backbone.View.extend({
  template: JST["<%= jst 'new' %>"],

  events: {
    "submit #new-<%= singular_name %>": "save"
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
      success: function(<%= singular_name %>) {
        self.model = <%= singular_name %>;
        window.location.hash = "/" + self.model.id;
      },

      error: function(<%= singular_name %>, jqXHR) {
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

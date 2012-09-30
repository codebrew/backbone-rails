(function() {

  (<%= view_namespace %>) || (<%= view_namespace %> = {});

  <%= view_namespace %>.NewView = Backbone.View.extend({

    template: JST["<%= jst 'new' %>"],

    events: {
      "submit #new-<%= singular_name %>": "save"
    },

    constructor: function(options) {
      Backbone.View.prototype.constructor.call(this,options);

      this.model = new this.collection.model();

      this.model.on("change:errors", function() { return this.render(); });
    },

    save: function(e)  {
      e.preventDefault();
      e.stopPropagation();

      this.model.unset("errors");

      var view = this;
      this.collection.create(this.model.toJSON(), {
        success: function(<%= singular_name %>) {
          view.model = <%= singular_name %>;
          window.location.hash = "/" + view.model.id;
        },
        error: function(<%= singular_name %>, jqXHR) {
          view.model.set({ errors : $.parseJSON(jqXHR.responseText) });
        }
      })
    },

    render: function() {
      this.$el.html(this.template(this.model.toJSON()));
      this.$("form").backboneLink(this.model);
      return this;
    }

  });

}).call(this);

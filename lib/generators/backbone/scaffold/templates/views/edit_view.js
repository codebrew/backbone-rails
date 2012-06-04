(function() {

  (<%= view_namespace %>) || (<%= view_namespace %> = {});

  <%= view_namespace %>.EditView = Backbone.View.extend({

    template : JST["<%= jst 'edit' %>"],

    events : {
      "submit #edit-<%= singular_name %>" : "update"
    },

    update : function(e) {
      e.preventDefault();
      e.stopPropagation();

      var view = this;
      this.model.save(null, {
        success : function(<%= singular_name %>)  {
          view.model = <%= singular_name %>;
          window.location.hash = "/" + view.model.id;
        }
      });
    },

    render : function() {
      this.$el.html(this.template(this.model.toJSON()));
      this.$("form").backboneLink(this.model);
      return this;
    }

  });

}).call(this);

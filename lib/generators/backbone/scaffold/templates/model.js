(function() {

  <%= model_namespace %> = Backbone.Model.extend({

    paramRoot: '<%= singular_table_name %>',

    defaults: {
  <% attributes.each_with_index do |attribute,i| -%>
    <%= attribute.name %>: null <%= i < (attributes.size - 1) ? "," : "" %>
  <% end -%>
    }

  });

  <%= collection_namespace %>Collection = Backbone.Collection.extend({
    model: <%= model_namespace %>,
    url: '<%= route_url %>'
  });

}).call(this);

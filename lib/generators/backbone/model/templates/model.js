<%= model_namespace %> = Backbone.Model.extend({
  paramRoot: '<%= singular_table_name %>',

  defaults: {
    <%= attributes.collect { |a| "#{a.name}: null" }.join(",\n    ") %>
  }
});

<%= collection_namespace %>Collection = Backbone.Collection.extend({
  model: <%= model_namespace %>,
  url: '<%= route_url %>'
});

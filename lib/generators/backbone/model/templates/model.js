<%= model_namespace %> = Backbone.Model.extend({
  paramRoot: '<%= singular_table_name %>',

  defaults: {
<% attributes.each do |attribute| -%>
    <%= attribute.name %>: null,
<% end -%>
  }
});

<%= collection_namespace %>Collection = Backbone.Collection.extend({
  model: <%= model_namespace %>,
  url: '<%= route_url %>'
});

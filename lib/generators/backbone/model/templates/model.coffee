class <%= model_namespace %> extends Backbone.Model
  paramRoot: '<%= singular_table_name %>'

  defaults:
<% attributes.each do |attribute| -%>
    <%= attribute.name %>: null
<% end -%>

class <%= collection_namespace %>Collection extends Backbone.Collection
  model: <%= model_namespace %>
  url: '<%= route_url %>'

class <%= model_namespace %> extends Backbone.Model
  paramRoot: '<%= singular_table_name %>'

  defaults:
<% attributes.each do |attribute| -%>
    <%= attribute.name %>: null
<% end -%>
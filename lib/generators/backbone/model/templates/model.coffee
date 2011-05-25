class <%= @model_namespace %> extends Backbone.Model
  paramRoot: '<%= singular_table_name %>'
  
class <%= @collection_namespace %>Collection extends Backbone.Collection
  model: <%= @model_namespace %>
  url: '<%= route_url %>'
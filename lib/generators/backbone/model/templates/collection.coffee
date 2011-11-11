class <%= collection_namespace %>Collection extends Backbone.Collection
  model: <%= model_namespace %>
  url: '<%= route_url %>'